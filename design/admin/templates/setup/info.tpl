<div class="context-block">
{* DESIGN: Header START *}<div class="box-header"><div class="box-tc"><div class="box-ml"><div class="box-mr"><div class="box-tl"><div class="box-tr">

<h1 class="context-title">{'System information'|i18n( 'design/admin/setup/info' )}</h1>

{* DESIGN: Mainline *}<div class="header-mainline"></div>

{* DESIGN: Header END *}</div></div></div></div></div></div>

{* DESIGN: Content START *}<div class="box-bc"><div class="box-ml"><div class="box-mr"><div class="box-bl"><div class="box-br"><div class="box-content">

<div class="context-attributes">

    <h2>eZ publish</h2>

    <div class="block">
        <label>{'Site'|i18n( 'design/admin/setup/info' )}</label>
        {ezini('SiteSettings','SiteURL')}
    </div>

    <div class="block">
        <label>{'Version'|i18n( 'design/admin/setup/info', 'eZ publish version' )}</label>
        {$ezpublish_version}
    </div>

    <div class="block">
        <label>{'SVN revision'|i18n( 'design/admin/setup/info', 'eZ publish version' )}</label>
        {$ezpublish_revision}
    </div>

    <div class="block">
        <label>{'Extensions'|i18n( 'design/admin/setup/info', 'eZ publish extensions' )}</label>
        {section loop=$ezpublish_extensions}{$:item}{delimiter}, {/delimiter}{/section}
    </div>


    <h2>PHP</h2>
    <div class="block">
        <label>{'Version'|i18n( 'design/admin/setup/info', 'PHP version' )}</label>
        {$php_version}
    </div>

    <div class="block">
        <label>{'Extensions'|i18n( 'design/admin/setup/info', 'PHP extensions' )}</label>
        {section loop=$php_loaded_extensions}{$:item}{delimiter}, {/delimiter}{/section}
    </div>

    <div class="block">
    <label>{'Miscellaneous'|i18n( 'design/admin/setup/info' )}</label>
        {section show=$php_ini.safe_mode}
            {'Safe mode is on.'|i18n( 'design/admin/setup/info' )}<br/>
        {section-else}
            {'Safe mode is off.'|i18n( 'design/admin/setup/info' )}<br/>
        {/section}
        {section show=$php_ini.open_basedir}
            {'Basedir restriction is on and set to %1.'|i18n( 'design/admin/setup/info',, array( $php_ini.open_basedir ) )}<br/>
        {section-else}
            {'Basedir restriction is off.'|i18n( 'design/admin/setup/info' )}<br/>
        {/section}
        {section show=$php_ini.register_globals}
            {'Global variable registration is on.'|i18n( 'design/admin/setup/info' )}<br/>
        {section-else}
            {'Global variable registration is off.'|i18n( 'design/admin/setup/info' )}<br/>
        {/section}
        {section show=$php_ini.file_uploads}
            {'File uploading is enabled.'|i18n( 'design/admin/setup/info' )}<br/>
        {section-else}
            {'File uploading is disabled.'|i18n( 'design/admin/setup/info' )}<br/>
        {/section}
        {'Maximum size of post data (text and files) is %1.'|i18n( 'design/admin/setup/info',, array( $php_ini.post_max_size ) )}<br/>
        {'Script memory limit is %1.'|i18n( 'design/admin/setup/info' ,,array( $php_ini.memory_limit ) )}<br/>
        {'Maximum execution time is %1 seconds.'|i18n( 'design/admin/setup/info',, array( $php_ini.max_execution_time ) )}<br/>
    </div>

    <h2>{'Webserver'|i18n( 'design/admin/setup/info', 'Webserver title' )}</h2>

    {section show=$webserver_info}

    <div class="block">
        <label>{'Name'|i18n( 'design/admin/setup/info', 'Webserver name')}</label>
        {$webserver_info.name}
    </div>

    <div class="block">
        <label>{'Version'|i18n( 'design/admin/setup/info', 'Webserver version')}</label>
        {$webserver_info.version}
    </div>

    <div class="block">
    <label>{'Modules'|i18n( 'design/admin/setup/info', 'Webserver modules')}</label>
    {section show=$webserver_info.modules}
        {section loop=$webserver_info.modules}{$:item}{delimiter}, {/delimiter}{/section}
    {section-else}
        {'Webserver modules could not be detected'|i18n( 'design/admin/setup/info', 'Webserver modules')}
    {/section}
    </div>

    {section-else}
        {'eZ publish was unable to extract information from the webserver.'|i18n( 'design/admin/setup/info' )}
    {/section}



<h2>PHP Accelerator</h2>

{section show=$php_accelerator}

<div class="block">
<label>{'Name'|i18n( 'design/admin/setup/info', 'PHP Accelerator name' )}</label>
{section show=$php_accelerator.url}<a href="{$php_accelerator.url|wash}">{/section}{$php_accelerator.name|wash}{section show=$php_accelerator.url}</a>{/section}
</div>

<div class="block">
    <label>{'Version'|i18n( 'design/admin/setup/info', 'PHP Accelerator version' )}</label>
    {section show=$php_accelerator.version_string}
        {$php_accelerator.version_string|wash}
        {section-else}
        {'Version information could not be detected.'|i18n( 'design/admin/setup/info' )}
    {/section}
</div>

<div class="block">
    <label>{'Status'|i18n( 'design/admin/setup/info' ,'PHP Accelerator status')}</label>
    {section show=$php_accelerator.enabled}
        {'Enabled.'|i18n( 'design/admin/setup/info' )}
    {section-else}
        {'Disabled.'|i18n( 'design/admin/setup/info' )}
    {/section}
</div>

{section-else}
    {'There is no known PHP accelerator active.'|i18n( 'design/admin/setup/info' )}
{/section}


<h2>{'Database'|i18n( 'design/admin/setup/info' )}</h2>

<div class="block">
    <label>{'Type'|i18n( 'design/admin/setup/info', 'Database type' )}</label>
    {$database_info}
</div>

<div class="block">
    <label>{'Server'|i18n( 'design/admin/setup/info', 'Database server' )}</label>
    {$database_object.database_server}
</div>

<div class="block">
    <label>{'Socket path'|i18n( 'design/admin/setup/info', 'Database socket path' )}</label>
    {section show=$database_object.database_socket_path}
        {$database_object.database_socket_path}
    {section-else}
        {'Not in use.'|i18n( 'design/admin/setup/info' )}
    {/section}
</div>

<div class="block">
    <label>{'Database name'|i18n( 'design/admin/setup/info', 'Database name' )}</label>
    {$database_object.database_name}
</div>

<div class="block">
    <label>{'Connection retry count'|i18n( 'design/admin/setup/info', 'Database retry count' )}</label>
    {$database_object.retry_count}
</div>

<div class="block">
    <label>{'Character set'|i18n( 'design/admin/setup/info', 'Database charset' )}</label>
    {$database_charset|wash}{section show=$database_object.is_internal_charset} ({'Internal'|i18n( 'design/admin/setup/info' )}){/section}
</div>

<h2>{'Slave database (read only)'|i18n( 'design/admin/setup/info' )}</h2>

{section show=$database_object.use_slave_server}

    <div class="block">
        <label>{'Server'|i18n( 'design/admin/setup/info', 'Database server' )}</label>
        {$database_object.slave_database_server}
    </div>

    <div class="block">
        <label>{'Database'|i18n( 'design/admin/setup/info', 'Database name' )}</label>
        {$database_object.slave_database_name}
    </div>

{section-else}

    {'There is no slave database in use.'|i18n( 'design/admin/setup/info' )}

{/section}

</div>

{* DESIGN: Control bar END *}</div></div></div></div></div></div>

</div>