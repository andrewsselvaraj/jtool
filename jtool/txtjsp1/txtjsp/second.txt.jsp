<script language="javascript">



   function recalculate(mfrCode)
   {
   	alert("Start");

     var hGeneric = '<%=strValue%>';
     TrimAllFields();
   	  if(mfrCode == 'CAT')
	  {
	  //cat only
	  }
     document.DCSForm.hRecalcClicked.value="YES";

	 fnCheckAuth();
	 
	 //if make is selected model should be selected
	 if (!fnCheckModel())
	 {
	 	return false;
	 }
	 
     if (document.forms[0].hMfr.value == "DET")
     {
		 document.forms(0).hRetainModel.value = document.forms[0].hTxt14.selectedIndex;
	 }


     if (PartsSize > 0)
     {
       <!-- Flag for Parts Array()  -->
       var flag = false;

       <!-- Flag for Validate Number() -->
       var status = false;

       <!-- Flag for FTL validate()  -->
       var flagFTL = true;

       <!-- Flag for MAC validate()  -->
       var flagMAC = true;
       
      <!-- Validate for Parts Array  -->
       if (validatePartsArray(mfrCode))
       {
         flag = true;
       }
       <!-- Validate for Number values if Status true -->
       if(flag)
       {
        status = validateNumber(mfrCode);
       }
       <!-- If flag and Status true validate FTL or MAC -->
       if(flag && status)
       {
	if(mfrCode=='MAC')
         {
          flagMAC = validateMAC();  <!-- Validate MAC -->
         }
       }
       <!-- if Flag & Status & ( FTL || MAC || others validated ) -->
       <!-- flagMAC and flagFTL are set to true confirmed when Function called -->
       if(flag && status && flagMAC && flagFTL)
       {
<%
  if(("").equals(strHCount))
  {
%>
        document.forms(0).hCount.value = <%=(iCount)%>;
<%
  }
  else
  {
%>
        document.forms(0).hCount.value = <%=(Integer.parseInt(strHCount))%>;
<%
  }
%>
        document.DCSForm.purpose.value="recalculate";
        document.DCSForm.action =webRoot + "/servlet/com.penske.ecs.servlet.CPSDCSProcess";
        document.DCSForm.submit();
		wait();
      }
    }
    else
    {
     <!-- Validate for Parts Array  -->
     var flag = false;
     var status = false;
     status = validateNumber(mfrCode);
     if(status)
     {
<%
  if(("").equals(strHCount))
  {
%>
      document.forms(0).hCount.value = <%=(iCount)%>;
<%
  }
  else
  {
%>
      document.forms(0).hCount.value = <%=(Integer.parseInt(strHCount))%>;
<%
  }
%>
      if (validateLaborArray(mfrCode))
      {
<% 
  if((strValue.indexOf("FTL") != -1) && !"SU".equals(strUserRole)) 
  { 
%>        
       <!-- Added for New MR -->
       if(document.forms[0].rdClaimType[0].checked && (document.forms[0].hTxt14.selectedIndex <= 0)) {
         alert(message[273]);
         document.forms[0].hTxt14.focus();
        return false;
       }     
<% 
  }
  if ("FTL".equals(strMfrDispCode))
  {
%>   
		 if (!isFloatFormat(document.forms(0).hTxt15.value, 5, 2))
		 {
			alert(message[284]);
			document.forms(0).hTxt15.focus();
			return false;
		 }	
		 if (!isFloatFormat(document.forms(0).hTxt16.value, 5, 2))
		 {
			alert(message[285]);
			document.forms(0).hTxt16.focus();
			return false;
		 }	
<%
  }
%>
	  // validation after new tow fields add in DCSForm for SP and CAT	
	  	alert("hi");	
        document.DCSForm.purpose.value="recalculate";
        //document.DCSForm.purpose.value="back";
        document.DCSForm.action =webRoot + "/servlet/com.penske.ecs.servlet.CPSDCSProcess";
        document.DCSForm.submit();
        wait();
      }
     }
    }
   }
  
  </script>