<?php
//
// Created on: <08-Aug-2002 14:04:07 bf>
//
// Copyright (C) 1999-2004 eZ systems as. All rights reserved.
//
// This source file is part of the eZ publish (tm) Open Source Content
// Management System.
//
// This file may be distributed and/or modified under the terms of the
// "GNU General Public License" version 2 as published by the Free
// Software Foundation and appearing in the file LICENSE included in
// the packaging of this file.
//
// Licencees holding a valid "eZ publish professional licence" version 2
// may use this file in accordance with the "eZ publish professional licence"
// version 2 Agreement provided with the Software.
//
// This file is provided AS IS with NO WARRANTY OF ANY KIND, INCLUDING
// THE WARRANTY OF DESIGN, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE.
//
// The "eZ publish professional licence" version 2 is available at
// http://ez.no/ez_publish/licences/professional/ and in the file
// PROFESSIONAL_LICENCE included in the packaging of this file.
// For pricing of this licence please contact us via e-mail to licence@ez.no.
// Further contact information is available at http://ez.no/company/contact/.
//
// The "GNU General Public License" (GPL) is available at
// http://www.gnu.org/copyleft/gpl.html.
//
// Contact licence@ez.no if any conditions of this licencing isn't clear to
// you.
//

include_once( "lib/ezutils/classes/ezhttptool.php" );

include_once( "kernel/common/template.php" );

include_once( "kernel/classes/ezsearchlog.php" );

$http =& eZHTTPTool::instance();

$module =& $Params["Module"];

if ( $module->isCurrentAction( 'ResetSearchStats' ) )
{
    eZSearchLog::removeStatistics();
}

$tpl =& templateInit();

$mostFrequentPhraseArray =& eZSearchLog::mostFrequentPhraseArray();

$tpl->setVariable( "most_frequent_phrase_array", $mostFrequentPhraseArray );

$Result = array();
$Result['content'] =& $tpl->fetch( "design:search/stats.tpl" );
$Result['path'] = array( array( 'text' => ezi18n( 'kernel/search', 'Search stats' ),
                                'url' => false ) );

?>
