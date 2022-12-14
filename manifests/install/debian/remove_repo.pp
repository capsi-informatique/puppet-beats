# @summary Remove the elastic repository
#
# @param remove_repository
#   Set to true to remove the elastic repository from the system
#   This allow the installation of the .deb without using a repository
#
# @param repository
#   Name of the repository in `/etc/apt/sources.list.d`
#
# @example
#   include beats::install::debian::remove_repo
class beats::install::debian::remove_repo (
  Boolean $remove_repository = true,
  String  $repository        = 'elastic',
) {
  if ($remove_repository) {
    apt::source { $repository:
      ensure => absent,
    }
  }
}
