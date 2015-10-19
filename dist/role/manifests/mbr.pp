# Basic Domain Member role
class role::mbr {
  info("Server is role MBR")
  include profile::base
  include profile::domain_member
}