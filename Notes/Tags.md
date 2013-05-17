Tags
====

### Create a tag

    git tag <tagName>
    git tag <tagName> <commitId = HEAD>
    git tag v1 5708b55


### Delete a local tag

    git tag -d <tagName>
    git tag -d v1


### Delete a remote tag

    git push <remoteName> --delete <tagName>


### Rename a tag

Delete the tag and recreate it
    
    git tag -d v1
    git tag v1 [commitId = HEAD]


### Checkout a tag

    git b <branchName> <tagName>
    git c <branchName>
    git cb uifixes v600


### Push one tag to a remote

    git push <remoteName> <tagName>
    git push <remoteName> tag <tagName>


### Push all tags to a remote

    git push --tags <remoteName>
