Summary:    Apache Servlet/JSP Engine, RI for Servlet 3.1/JSP 2.3 API
Name:       apache-tomcat
Version:    8.0.32
BuildArch:  noarch
Release:    1
License:    Apache Software License
#Group:     Application/Tomcat	
URL:        http://tomcat.apache.org/
Source:     apache-tomcat-8.0.32.tar.gz
Prefix:     /local/apps/tomcat

%description
Tomcat is the servlet container that is used in the official Reference
Implementation for the Java Servlet and JavaServer Pages technologies.
The Java Servlet and JavaServer Pages specifications are developed by
Sun under the Java Community Process.

Tomcat is developed in an open and participatory environment and
released under the Apache Software License. Tomcat is intended to be
a collaboration of the best-of-breed developers from around the world.
We invite you to participate in this open development project. To
learn more about getting involved, click here.

This package contains the base tomcat installation that depends on Sun's JDK and not
on JPP packages.

%prep
%setup

%build

%install

mkdir -p $RPM_BUILD_ROOT/local/apps/tomcat
cp -R * $RPM_BUILD_ROOT/local/apps/tomcat

%files
/local/apps/tomcat/

%clean




