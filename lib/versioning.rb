#require 'rugged'
module Versioning
  module Git
    attr_accessor :repo
    
    def create_repo(name)
      repo = Rugged::Repository.init_at('uploads/' + name, :bare)
      return repo
    end

    def open_repo(name)
      repo = Rugged::Repository.bare(name)
      return repo
    end

    def metal(action, *args)
      if(args.length>0)
	repo.send(action, args)
      else
	repo.send(action)
      end
    end

    def close
      repo.close
    end

    def add_file(name, content)
      oid = repo.write(content, :blob)
      index = repo.index
      entry = {
	:path => name,
	:oid => oid,
	:mode => 0100644
      }
      index.add(entry)
      index.write
    end

    def remove_file(name)
      index = repo.index
      index.remove(name)
      index.write
    end

    def update_file(name, content)
      add_file(name, content)
    end

    def commit(message, user)
      index = repo.index
      options = {}
      options[:author] = {
	:name => user.name,
	:email => user.email,
	:time => Time.now
      }
      options[:committer] = options[:author]
      options[:tree] = index.write_tree
      options[:message] = message
      options[:parents] = repo.empty? ? [] : [ repo.head.target ].compact
      options[:update_ref] = 'HEAD'
      Rugged::Commit.create(repo, options)
    end

    def commits
      walker = Rugged::Walker.new(repo)
      walker.push(repo.head.target)
      return walker
    end

    def get_diffs(commit1, commit2)
      diff = commit1.diff(commit2)
      diff.find_similar!
      return diff
    end

    def get_diffs_for_file(name, commit1, commit2)
      options = {
	:paths => [name]
      }
      diff = commit1.diff(commit2, options)
      diff.find_similar!
      return diff
    end

    def commits_that_changed(name)
      options = {
	:paths => [name]
      }
      latest_commit = repo.head.target
      walker = commits
      walker.select do |commit|
	latest_commit.diff(commit, options).size > 0
      end
    end

    def file_back_to_version(path, commit)
      options = {
	:paths => [path]
      }
      repo.checkout(commit, options)
      return repo.head.target.tree[path].content
    end

  end

end
