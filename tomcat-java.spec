%define __jar_repack 0

Summary:    Java JRE for use with Apache Tomcat
Name:       jre
Version:    1.8.0
BuildArch:  noarch
Release:    92
License:    GPL
Vendor:	    Oracle
Group:      Product Engineering
URL:        http://www.java.com/en/
Source:     jre-8u92-linux-x64.tar.gz
Prefix:     /local/apps/tomcat/java
AutoReqProv: no

%description
Java JRE runtime for Tomcat

%prep
tar zxf $RPM_SOURCE_DIR/jre-8u92-linux-x64.tar.gz -C $RPM_BUILD_DIR --strip 1

%build

%install
mkdir -p $RPM_BUILD_ROOT/local/apps/tomcat/java
cp -R * $RPM_BUILD_ROOT/local/apps/tomcat/java

%files
/local/apps/tomcat/java

%clean

