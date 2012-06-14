# /
 # Copyright (2009 - 2013) MDoffice, Inc. USA
 #
 # See license distributed with this file and available online at
 #
 #http://www.mdoffice.com/mdo2/index.php?option=com_content&view=article&id=90&Itemid=99

# / ========================================================================
 #
 # File: claim/billing/_claim_error.xml.builder
 #
 # Description: Single item of the element
 #
 # Version: 3.0
 #
 # Author: Murali Dhar
 #
 # Created On: Feb 20,2012
 #
 # History
 #
 # Modified By: xx xx on xx xx, xxxx
 #
 # 
 #
 # / ========================================================================
 xml.claim do
  errors = claim[:errors]
  status = claim[:claim_status]
  claim[:claim].attributes.each { |col, value|
			xml.tag!(col, value)
		}
  xml << render('shared/errors', :target => errors ) if errors
  xml.status status.to_s if status

end