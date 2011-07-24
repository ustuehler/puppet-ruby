# Install Rubygems for Ubuntu.  This class simply requires the
# ruby::gems::debian class as Ubuntu and Debian are unlikely to
# differ in their Ruby setup.
class ruby::gems::ubuntu
{
	require ruby::gems::debian
}
