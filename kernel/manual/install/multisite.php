<h1>Multi site configuration</h1>

<p>
If you are settings up serveral sites with one eZ publish 3 installation using site access you might want to seperate
seperate cache and storage directory. This will make things less cluttered and easy to manage when having
many sites per installation.
</p>

<p>
The default settings in eZ publish 3 stores cache and files in a common directory for all sites. This can cause problems if
you e.g want to move one of the sites to another server. This can be changed by setting some variables in
your site.ini.append for each of your sites.
</p>

<p>
In this example we will seperate storage files and cache for myfirst.ezpsite.com, admin.myfirst.ezpsite.com, mysecond.ezpsite.com
and admin.mysecond.ezpsite.com. After setting up site access (which you can read more about <a href="siteaccess">here</a>)
we need to set some additional settings in the site.ini.append files.
</p>

<pre class="example">
file: settings/siteaccess/myfirst/site.ini.append
[FileSettings]
StorageDir=myfirst/storage
CacheDir=myfirst/cache
</pre>
<br />

<pre class="example">
file: settings/siteaccess/admin.myfirst/site.ini.append
[FileSettings]
StorageDir=myfirst/storage
CacheDir=myfirst/cache
</pre>
<br />

<pre class="example">
file: settings/siteaccess/mysecond/site.ini.append
[FileSettings]
StorageDir=mysecond/storage
CacheDir=mysecond/cache
</pre>
<br />

<pre class="example">
file: settings/siteaccess/admin.mysecond/site.ini.append
[FileSettings]
StorageDir=mysecond/storage
CacheDir=mysecond/cache
</pre>

<p>
Now we told eZ publish to store myfirsts cache in var/myfirst/cache and myfirsts files in /var/mysecond/storage. Same goes
for the mysecond site.
</p>

<p class="important"><b>Important:</b> It is important that both the user and admin site has the same storage directory, or else
if you e.g upload a new file using the admin site the user site wont be able to locate the file because it is looking for the file
in a different directory.
</p>
