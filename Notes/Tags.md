h1. Tags

**Create a tag**
git tag <tag-name>
git tag <tag-name> <commit-id == HEAD>
git tag v1 5708b55


**Delete a local tag**
git tag -d <tag-name>
git tag -d v1


**Delete a remote tag**
git push <remote-name> --delete <tag-name>


**Rename a tag**
Delete the tag and recreate it
git tag -d v1
git tag v1 [commit-id == HEAD]


**Checkout a tag**
git b branchname tagname
git c branchname
git cb uifixes v600


**Push one tag to a remote**
git push <remote-name> <tag-name>
git push <remote-name> tag <tag-name>


**Push all tags**
git push --tags <remote-name>
