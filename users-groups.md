
#groups and users

- create a user
adduser

- create a group
addgroup

- display groups of the user
groups

- display users of a group
'users' should do it, BUT NOPE (just shows logged users)...Instead:
getent group 

- add user to secondary group
gpasswd -a someuser somegroup

- remove user from secondary 
gpasswd -d somegroup someuser

# other
usermod : dangerous unfriendly user manage, best use gpasswd 