<?php
//
// Processing of paypal's callback.
//
// Created on: <26-Apr-2004 14:18:58 dl>
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

/*! \file notify_url.php
*/

include_once( 'kernel/shop/paymentgateways/ezpaypal/classes/ezpaypalchecker.php' );

$logger  =& eZPaymentLogger::CreateForAdd('var/log/eZPaypal_notify_url.log');
$checker =& new eZPaypalChecker( 'paypal.ini' );

if( $checker->createDataFromPOST() )
{
  unset ($_POST);                     
  if( $checker->requestValidation() && $checker->checkPaymentStatus() )
  {
      $orderID = $checker->getFieldValue( 'custom' );
      if( $checker->setupOrderAndPaymentObject( $orderID ) )
      {
          $amount   = $checker->getFieldValue( 'mc_gross' );
          $currency = $checker->getFieldValue( 'mc_currency' );
          if( $checker->checkAmount( $amount ) && $checker->checkCurrency( $currency ) )
          {
              $checker->approvePayment();
          }
      }
  }
}

$logger->writeTimedString( 'notify_url.php was propertly ended' );

?>