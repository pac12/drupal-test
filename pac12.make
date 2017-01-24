api = 2
core = 7.x

;***************;
;* Drupal core *;
;***************;

projects[drupal][type] = core
projects[drupal][version] = 7.53
projects[drupal][download][type] = get
projects[drupal][download][url] = http://ftp.drupal.org/files/projects/drupal-7.53.tar.gz

;*******************;
;* Contrib modules *;
;*******************;

; Devel
projects[devel][subdir] = contrib
projects[devel][version] = 1.5

; Features
projects[features][subdir] = contrib
projects[features][version] = 2.10

; jQuery Update
projects[jquery_update][subdir] = contrib
projects[jquery_update][version] = 2.7
