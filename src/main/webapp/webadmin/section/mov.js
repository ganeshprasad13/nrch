<SCRIPT LANGUAGE="JavaScript">
<!-- This script and many more are available free online at -->
<!-- The JavaScript Source!! http://javascript.internet.com -->
<!-- Original:  Fred P -->
<!-- Begin
// Compare two options within a list by VALUES
function compareOptionValues(a, b) 
{ 
  // Radix 10: for numeric values
  // Radix 36: for alphanumeric values
  var sA = parseInt( a.value, 36 );  
  var sB = parseInt( b.value, 36 );  
  return sA - sB;
}

// Compare two options within a list by TEXT
function compareOptionText(a, b) 
{ 
  // Radix 10: for numeric values
  // Radix 36: for alphanumeric values
  var sA = parseInt( a.text, 36 );  
  var sB = parseInt( b.text, 36 );  
  return sA - sB;
}

// Dual list move function
function moveDualList( srcList, destList, moveAll ) 
{
  // Do nothing if nothing is selected
  if (  ( srcList.selectedIndex == -1 ) && ( moveAll == false )   )
  {
    return;
  }

  newDestList = new Array( destList.options.length );

  var len = 0;

  for( len = 0; len < destList.options.length; len++ ) 
  {
    if ( destList.options[ len ] != null )
    {
      newDestList[ len ] = new Option( destList.options[ len ].text, 
destList.options[ len ].value, destList.options[ len ].defaultSelected, 
destList.options[ len ].selected );
    }
  }

  for( var i = 0; i < srcList.options.length; i++ ) 
  { 
    if ( srcList.options[i] != null && ( srcList.options[i].selected == 
true || moveAll ) )
    {
       // Statements to perform if option is selected

       // Incorporate into new list
	   
	   
       newDestList[ len ] = new Option( srcList.options[i].text, 
srcList.options[i].value, srcList.options[i].defaultSelected, 
srcList.options[i].selected );
       len++;
    }
  }
  
  
  
  newDestList.sort( compareOptionValues );   // BY VALUES
  //newDestList.sort( compareOptionText );   // BY TEXT

  // Populate the destination with the items from the new array
  for ( var j = 0; j < newDestList.length; j++ ) 
  {
    if ( newDestList[ j ] != null )
    {
      destList.options[ j ] = newDestList[ j ];
    }
  }

  // Erase source list selected elements
  for( var i = srcList.options.length - 1; i >= 0; i-- ) 
  { 
    if ( srcList.options[i] != null && ( srcList.options[i].selected == 
true || moveAll ) )
    {
       // Erase Source
       //srcList.options[i].value = "";
       //srcList.options[i].text  = "";
       srcList.options[i]       = null;
    }
  }

} // End of moveDualList()
//  End -->

  
function selAll(){

var i;
for(i=0;i<myForm.listRight.length;i++){

	myForm.listRight.options[i].selected =true ;

}
var j;
for(j=0;j<myForm.listLeft.length;j++){

	myForm.listLeft.options[j].selected =true ;

}
}


  
function selAll_Share(){

var i;
for(i=0;i<myForm_Share.listRight_Share.length;i++){

	myForm_Share.listRight_Share.options[i].selected =true ;

}

var j;
for(j=0;j<myForm_Share.listLeft_Share.length;j++){

	myForm_Share.listLeft_Share.options[j].selected =true ;

}

}

function selAll_Server(){

var i;
for(i=0;i<myForm_Server.listRight.length;i++){

	myForm_Server.listRight.options[i].selected =true ;

}

var j;
for(j=0;j<myForm_Server.listLeft.length;j++){

	myForm_Server.listLeft.options[j].selected =true ;

}

}


function selAll_Alerts(){

var i;
for(i=0;i<frmAlertPersonal.listRight.length;i++){

	frmAlertPersonal.listRight.options[i].selected =true ;

}

var j;
for(j=0;j<frmAlertPersonal.listLeft.length;j++){

	frmAlertPersonal.listLeft.options[j].selected =true ;

}

}

function unSell_All(){
var i;
for(i=0;i<myForm.listLeft.length;i++){
	myForm.listLeft.options[i].selected = false ;
}
}
function resetSelectedServer() {
unSell_All();
var i;
for(i=0;i<myForm.listRight.options.length;i++){
	myForm.listRight.options[i] = null ;
}
}

</script>
