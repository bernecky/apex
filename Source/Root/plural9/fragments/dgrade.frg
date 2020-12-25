% Plural  Code fragments for dyadic upgrade, downgrade
% Robert Bernecky 2012-01-29

%Fragment ugrd 1** c c i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, int QUADio)
{ /* Quadav-upgrade on character non-vector */
z = QUADio + UpgradeHeap(y);
 return( z);
}
%Generate , UpgradeHeap, X$YTI, X**, ., $CT

%Fragment dgrd 1** c c i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, int QUADio)
{ /* Quadav-downgrade on character non-vector */
z = QUADio + DowngradeHeap(y);
 return( z);
}
%Generate , DowngradeHeap, X$YTI, X**, ., $CT


%Fragment ugrd 1** c c i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, int QUADio)
{ /* Generic dyadic upgrade on character non-vector */
 fixme 
}

%Fragment dgrd 1** c c i .
$ZTYPE $FNAME($XTYPE x, $YTYPE y, int QUADio)
{ /* Generic dyadic downgrade on character non-vector */
 fixme 
}

