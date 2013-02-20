;;; Commentary:

;;;   First pass at interfacing with facebook.  You must add the "developers
;;;   app" and get your own application api-key and application secret key to
;;;   use this.  Also, facebook's authentication scheme is, well, ridiculous,
;;;   so you've got to have gnutls or openssl installed, as well as a working
;;;   browser that handles https to log in and give your app permissions.
;;;   Also, it requires hober's excellent json.el which can be obtained here:
;;;   http://edward.oconnor.cx/elisp/json.el

;;;   To log into facebook, call (facebook-login)
;;;   To check credentials/optionally login call (facebook-check-creds)
;;;   To make api calls call (facebook-call-function "<funcname>"
(list (cons "of" "args") (cons "more" "args")))

;;;   Only two actual api functions are present right now, (though you can
;;;   use facebook-call-function to call whatever you'd like...):
;;;   facebook-users-has-app-permission = users.hasAppPermission
;;;   facebook-users-set-status = users.setStatus
;;;   facbeook-users-set-status checks for the applicable app permission
;;;   redirects the user to the permission page if needed and then goes and
;;;   updates the status.
