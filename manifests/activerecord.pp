# DEPRECATED: Use ruby::active_record instead.
class ruby::activerecord
{
  warning("${name} is deprecated; use ruby::active_record")
  require ruby::active_record
}
