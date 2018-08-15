# Install script for code snippets with NuGet
# =============================================
# Written by Geert van Horrik (see http://blog.catenalogic.com)
#
# Version 1.0 / 2011-02-18
#
# Required call to get environment variables

param($installPath, $toolsPath, $package, $project)

# You only have to customize the $snippetFolder name below,
# don't forget to rename the $snippetFolder of the other file
# ("uninstall.ps1") as well

$snippetFolder = "Assisticant"

# Actual script start
$source = "$toolsPath\*.snippet"
$vsVersions = @("2005", "2008", "2010", "2012", "2013", "2015", "2017")

Foreach ($vsVersion in $vsVersions)
{
	$myCodeSnippetsFolder = "$HOME\Documents\Visual Studio $vsVersion\Code Snippets\Visual C#\My Code Snippets\"

	if (Test-Path $myCodeSnippetsFolder)
	{
		$destination = "$myCodeSnippetsFolder$snippetFolder"
		if (!($myCodeSnippetsFolder -eq $destination))
		{
			if (!(Test-Path $destination))
			{
				New-Item $destination -itemType "directory"
			}
		
			"Installing code snippets for Visual Studio $vsVersion"
			Copy-Item $source $destination
		}
		else
		{
			"Define a value for snippetFolder variable, cannot be empty"
		}
	}
	else
	{
		"Path not found $myCodeSnippetsFolder"
	}
}
