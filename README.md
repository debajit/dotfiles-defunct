My Git Configuration and Workflow
=================================

My git configuration files, and my notes on workflows, for ready reference.


### Undoing things

* **“Amended a commit accidentally when I meant to add a new commit instead”**

    Usually you can do a git reset to fix things like this, but what commit do you reset to?
    
    git reflog
    
    Find out the commit you were in before your “commit --amend”. Usually this would be HEAD@{1}. Now do a
    
    git reset --soft HEAD@{1}
    
    
    
