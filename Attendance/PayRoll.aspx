﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayRoll.aspx.cs" Inherits="Attendance.PayRoll"
    EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <!-- <script src="js/overlibmws.js" type="text/javascript"></script>  -->
    <link rel="stylesheet" href="css/reset.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/UI.css" />
    <link rel="stylesheet" href="css/inputs.css" type="text/css" />
    <!-- <link rel="stylesheet" href="css/style.css" type="text/css" /> -->
    <link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="css/admin.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>

    <script src="js/jquery-ui.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="js/jquery-ui-timepicker-addon.js"></script>

    <script type="text/javascript" src="js/jquery-ui-sliderAccess.js"></script>

    <style type="text/css">
        .table1 td
        {
            border: #ccc 1px dotted;
            padding: 0px 4px;
            white-space: nowrap;
        }
        .table1 th, .table1 tr:first-child td
        {
            padding: 2px 4px;
            vertical-align: middle;
            background: #ccc;
            text-align: center;
        }
        .table1
        {
            font-size: 10px;
        }
        .table1 tr:first-child
        {
            font-weight: bold;
        }
        .table1
        {
            border: #999 1px solid;
            border-collapse: collapse;
        }
        .table1 td span
        {
            white-space: nowrap;
        }
    </style>

    <script type="text/javascript" language="javascript">
    
    $(window).load(function () {
      $('#lnkDwnloadPDF').css('visibility','hidden');
     $('#spinner').hide();
     
      $('#txtFromDate').datepicker({
            dateFormat: "mm/dd/yy"
            //timeFormat:"hh:mm tt"      
        });
          
          $('#txtToDate').datepicker({
            dateFormat: "mm/dd/yy"
            //timeFormat:"hh:mm tt"      
        });
        
        });
        
        
         function showspinner()
        {
         $('#spinner').show();
         return true;
        }
        
        function hidespinner()
        {
         $('#spinner').hide();
         return true;
        }
        
        function pageLoad()
        {
            $('#spinner').hide();            
            
        }
        function linkdis()
        {
        debugger    
           $('#lnkDwnloadPDF').css('visibility','visible');
         
           return true;
        }
        
        
        function validateDate()
        {
        debugger
        var valid=true;
          var Stdate=new Date($('#txtFromDate').val());
          var EndDate=new Date($('#txtToDate').val());
          if(Stdate>EndDate)
          {
          
            alert("Todate should be greaterthan from date");
            $('#txtToDate').val('');
            $('#txtToDate').focus();
            valid=false;
          }
          return valid;
          
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
    <cc1:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
    <div id="spinner">
        <h4>
            <div>
                Processing
                <img src="images/loading.gif" />
            </div>
        </h4>
    </div>
    <div class="headder">
        <a href="#" class="logo">
            <asp:Label ID="comanyname" runat="server" ForeColor="White"></asp:Label>
            <asp:Label ID="lblLocation" runat="server"></asp:Label>
        </a>
        <div class="right">
            <div class="wel">
                <table style="width: auto; margin-left: 20px; float: right; border-collapse: collapse">
                    <tr>
                        <td style="vertical-align: middle; padding-top: 3px;">
                            <div class="inOut">
                                SCHEDULE:
                                <asp:Label ID="lblHeadSchedule" runat="server"></asp:Label>
                            </div>
                            <b>User:</b>
                            <asp:Label ID="lblEmployyName" runat="server"></asp:Label>&nbsp;&nbsp;
                            <div class="clear h51">
                                &nbsp;</div>
                            <asp:Button ID="btnLogout" CssClass=" btn btn-small btn-mini btn-success floatR"
                                runat="server" Text="Logout" OnClick="btnLogout_Click" OnClientClick="return showspinner();" />
                            <ul class="menu2">
                                <li><a href="#" class="dropdown-menu">Menu <span class="pic">&nbsp;</span> </a>
                                    <ul>
                                        <li>
                                            <asp:LinkButton ID="lnkReport" runat="server" Text="Attendance Report" OnClick="lnkReport_Click"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton ID="lnkPayroll" runat="server" Text="Payroll Report" PostBackUrl="PayRoll.aspx"></asp:LinkButton></li>
                                        <li>
                                            <asp:LinkButton runat="server" ID="lnkUserMangement" Text="Employee Management" 
                                                onclick="lnkUserMangement_Click" ></asp:LinkButton></li>
                                        <li>
                                            <asp:UpdatePanel ID="ppp" runat="server">
                                                <ContentTemplate>
                                                    <asp:LinkButton runat="server" ID="lnkChangepwd" Text="Change Password" OnClick="lnkChangepwd_Click"></asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                        <li>
                                            <asp:UpdatePanel ID="UpPasscode" runat="server">
                                                <ContentTemplate>
                                                    <asp:LinkButton runat="server" ID="lnkChangePasscode" Text="Change Passcode" OnClick="lnkChangePasscode_Click"></asp:LinkButton>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                            <!-- Show Clock Start  -->
                            <div class="tDate">
                                <asp:Label ID="lblDate2" runat="server" Style="display: none"></asp:Label>
                                <%--  <asp:Label ID="lblPrevTime" runat="server" Text=""></asp:Label>--%>
                                <span class="cDate" style="margin-bottom: 1px; margin-top: 2px; float: left; display: inline-block">
                                </span>
                                <div class="cTime" style="display: inline-block; float: right; margin-left: 10px;">
                                    <b>--:--:-- AM </b><strong>(<asp:Label ID="lblTimeZoneName" runat="server"></asp:Label>)</strong>
                                </div>

                                <script src="js/clock.js" type="text/javascript"></script>

                            </div>
                            <!-- Show Clock End  -->
                        </td>
                        <td style="vertical-align: top; width: 35px;">
                            <%-- <asp:Image ID="Image1" runat="server" ImageUrl="Photos/defaultUSer.jpg" />--%>
                            <img src="Photos/defaultUSer.jpg" class="topPic" runat="server" id="Photo" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!--Change password popup start-->
    <cc1:ModalPopupExtender ID="mdlChangePwd" runat="server" BackgroundCssClass="popupHolder"
        CancelControlID="lnkPwdClose" TargetControlID="hdnChangePwd" PopupControlID="ChangePwd">
    </cc1:ModalPopupExtender>
    <asp:HiddenField ID="hdnChangePwd" runat="server" />
    <div id="ChangePwd" runat="server" class="popContent" style="width: 400px; display: none">
        <h2>
            <asp:UpdatePanel ID="UpdatePanel8" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblPwdName" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <span class="close">
                <asp:LinkButton ID="lnkPwdClose" runat="server"></asp:LinkButton></span>
        </h2>
        <div class="inner">
            <table style="width: 97%; margin: 20px 5px; border-collapse: collapse;">
                <tr>
                    <td>
                        Old password<span class="must">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOldpwd" runat="server" MaxLength="8" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        New password<span class="must">*</span>
                        <br />
                        <span style="font-size: 10px; color: GrayText">(Maximum 10 characters)</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewPwd" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Confirm password<span class="must">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPwd" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <div style="display: inline-block">
                            <asp:UpdatePanel ID="UpdatePanel9" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnUpdatePwd" runat="server" Text="Update" CssClass="btn btn-danger"
                                        OnClientClick="return validPwd();" OnClick="btnUpdatePwd_Click" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnCancelPwd" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <asp:Button ID="btnCancelPwd" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancelPwd_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!--Change password popup End-->
    <!--Change passcode popup start-->
    <cc1:ModalPopupExtender ID="mdlChangePasscode" runat="server" BackgroundCssClass="popupHolder"
        CancelControlID="lnkPasscodeClose" TargetControlID="hdnChangePasscode" PopupControlID="passcodepopup">
    </cc1:ModalPopupExtender>
    <asp:HiddenField ID="hdnChangePasscode" runat="server" />
    <div id="passcodepopup" runat="server" class="popContent" style="width: 400px; display: none">
        <h2>
            <asp:UpdatePanel ID="UpdatePanel11" runat="server">
                <ContentTemplate>
                    <asp:Label ID="lblPasscodeName" runat="server"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <span class="close">
                <asp:LinkButton ID="lnkPasscodeClose" runat="server"></asp:LinkButton></span>
        </h2>
        <div class="inner">
            <table style="width: 97%; margin: 20px 5px; border-collapse: collapse;">
                <tr>
                    <td>
                        Old passcode<span class="must">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtOldpasscode" runat="server" MaxLength="20" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        New passcode<span class="must">*</span>
                        <br />
                        <span style="font-size: 10px; color: GrayText">(Maximum 10 characters)</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtNewPasscode" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Confirm passcode<span class="must">*</span>
                    </td>
                    <td>
                        <asp:TextBox ID="txtConfirmPasscode" runat="server" MaxLength="10" TextMode="Password"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <div style="display: inline-block">
                            <asp:UpdatePanel ID="UpdatePanel12" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="btnUpdatePassCode" runat="server" Text="Update" CssClass="btn btn-danger"
                                        OnClientClick="return validPasscode();" OnClick="btnUpdatePassCode_Click" />
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnCancelPasscode" EventName="Click" />
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <asp:Button ID="btnCancelPasscode" runat="server" Text="Cancel" CssClass="btn" OnClick="btnCancelPasscode_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!--Change password popup End-->
    <asp:UpdateProgress ID="Progress" runat="server" AssociatedUpdatePanelID="up2" DisplayAfter="0">
        <ProgressTemplate>
            <div id="spinner">
                <h4>
                    <div>
                        Processing
                        <img src="images/loading.gif" />
                    </div>
                    <h4>
                    </h4>
                </h4>
            </div>
        </ProgressTemplate>
    </asp:UpdateProgress>
    <h2 class="pageHeadding">
        <asp:UpdatePanel ID="UpdatePanel7" runat="server">
            <ContentTemplate>
                <asp:Label ID="lblPayroll" runat="server" Text="Payroll report"></asp:Label>
                <br />
                <asp:Label ID="lblWeekPayrollReport" runat="server"></asp:Label> <br />
               <asp:Label ID="lblFreeze" runat="server" ForeColor="Red" Font-Bold="false" style="font-size:10px;"></asp:Label>
            </ContentTemplate>
        </asp:UpdatePanel>
    </h2>
    <div style="display: inline-block;margin-left: 20px;">
        <b>From date</b> &nbsp;<asp:TextBox ID="txtFromDate" runat="server" Width="150"></asp:TextBox>
        &nbsp;&nbsp; <b>To date</b> &nbsp;<asp:TextBox ID="txtToDate" runat="server" Width="150"></asp:TextBox>
        <div style="display: inline-block;">
            <asp:UpdatePanel ID="up2" runat="server">
                <ContentTemplate>
                    <asp:Button ID="btnGo" runat="server" Text="Go" OnClick="btnGo_Click" OnClientClick="return validateDate();"
                        CssClass="btn btn-danger btn-small right" />
                    &nbsp;
                 
                    &nbsp;
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <asp:Button ID="btnPDF" runat="server" Text="DownLoadToPDF" CssClass="btn btn-small btn-success"
            OnClick="btnPDF_Click1" OnClientClick="return linkdis();"></asp:Button>
        <asp:Button ID="btnDoc" runat="server" Text="DownLoadToWord" CssClass="btn btn-small btn-success"
            OnClick="btnDoc_Click1" OnClientClick="return linkdis();"></asp:Button>
    </div>
    <div id="dvpayrollreport" runat="server" style="font-size: 12px; font-family: Arial;
        color: #333;">
        <table cellpadding="30" cellspacing="0">
            <tr>
                <td style="padding: 10px">
                    <asp:UpdatePanel ID="up1" runat="server">
                        <ContentTemplate>
                            <asp:HiddenField ID="hdnPayrollPdf" runat="server" />
                            <div>
                            <asp:Label ID="lblTotal" runat="server" style="margin-left: 10px;"></asp:Label>
                            &nbsp;
                            <asp:Label ID="lblReportDate" runat="server" style="float:right;margin-right:92px;"></asp:Label>
                            </div>
                            <asp:GridView runat="server" AutoGenerateColumns="false" ID="grdPayRoll" CssClass="table1"
                                OnRowDataBound="grdPayRoll_RowDataBound" BorderWidth="1" CellPadding="0" CellSpacing="0"
                                Width="800px">
                                <Columns>
                                    <asp:TemplateField SortExpression="empid" HeaderText="EmpID">
                                        <%--  <HeaderTemplate>
                                <asp:LinkButton ID="lblHeadEmpID" runat="server" Text="EmpID"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnUserID" runat="server" Value='<%#Eval("empid")%>' />
                                            <asp:HiddenField ID="hdnEmpuserid" runat="server" Value='<%#Eval("UserID")%>' />
                                            <asp:Label ID="lblEmpID" runat="server" Text='<%#Eval("empid")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="Firstname" HeaderText="Name">
                                        <%--   <HeaderTemplate>
                                <asp:LinkButton ID="lblHeadEmpFirstname" runat="server" Text="Firstname"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmpFirstname" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>
                                            <asp:Label ID="lblEmpLastname" runat="server" Text='<%#Eval("LastName")%>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="JoiningDate" HeaderText="StartDt">
                                        <%--<HeaderTemplate>
                                <asp:LinkButton ID="lblHeadStarted" runat="server" Text="StartedDt"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblStartedDate" runat="server" Text='<%# Bind("StartDate", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="TerminatedDt" HeaderText="TermDt">
                                        <%--   <HeaderTemplate>
                                <asp:LinkButton ID="lblHeadTerminated" runat="server" Text="TerminatedDt"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblTerminatedDate" runat="server" Text='<%#Bind("TermDate","{0:MM/dd/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="DeptName" HeaderText="Department">
                                        <%--  <HeaderTemplate>
                                <asp:LinkButton ID="lblHeadDepartment" runat="server" Text="Department"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblDept" runat="server" Text='<%#Eval("DeptName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="EmployeeType" HeaderText="Type">
                                        <%--  <HeaderTemplate>
                                <asp:LinkButton ID="lblHeadDesignation" runat="server" Text="Designation"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblEmployeetype" runat="server" Text='<%#Eval("MasterEmpType")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="Location" HeaderText="Location">
                                        <%-- <HeaderTemplate>
                                <asp:LinkButton ID="lblHeadActive" runat="server" Text="Active"></asp:LinkButton>
                            </HeaderTemplate>--%>
                                        <ItemTemplate>
                                            <asp:Label ID="lblLocation" runat="server" Text='<%#Eval("LocationName")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="TotalHours" HeaderText="Hrs">
                                     <ItemTemplate>
                                            <asp:Label ID="lblTotal" runat="server" Text='<%#Eval("TotalHours")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField SortExpression="SSN" HeaderText="SSN">
                                     <ItemTemplate>
                                            <asp:Label ID="lblgrdSSN" runat="server" Text='<%#Eval("SSN")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                     <asp:TemplateField SortExpression="MaritalStatus" HeaderText="FilingStatus">
                                     <ItemTemplate>
                                            <asp:Label ID="lblFilingStatus" runat="server" Text='<%#Eval("MaritalStatus")%>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="Isnew" HeaderText="IsNew">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="lblIsNew" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField SortExpression="IsChanges" HeaderText="IsChanges">
                                      <ItemTemplate>
                                            <asp:Label ID="lblIsChanges" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                            <table cellpadding="0" cellspacing="0" width="900">
                                <tr>
                                    <td style="height: 30px;">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b class="headding2" style="margin-bottom: 0; padding-bottom: 0">
                                            <asp:Label ID="lblNewEmp" runat="server" style="padding: 10px;"></asp:Label></b>
                                        <asp:GridView ID="grdNewEmp" runat="server" AutoGenerateColumns="false" CssClass="table1"
                                            onrowdatabound="grdNewEmp_RowDataBound" Width="700px" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="Emp ID">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmpID" runat="server" Text='<%#Eval("empid")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Name">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmpName" runat="server" Text='<%#Eval("FirstName")%>'></asp:Label>
                                                        <asp:HiddenField ID="hdnLastname" runat="server" Value='<%#Eval("LastName")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Emp type">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblEmpType" runat="server" Text='<%#Eval("MasterEmpType")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Start date">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStart" runat="server" Text='<%#Eval("startdate")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Date of birth">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblBirthDate" runat="server" Text='<%# Bind("DateOfBirth", "{0:MM/dd/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Deductions">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeductions" runat="server" Text='<%#Eval("Deductions")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Address">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAddress" runat="server" Text='<%#Eval("Address1")%>'></asp:Label>
                                                        <asp:HiddenField ID="hdnAddress2" runat="server" Value='<%#Eval("Address2")%>' />
                                                        <asp:HiddenField ID="hdnZip" runat="server" Value='<%#Eval("zip")%>' />
                                                        <asp:HiddenField ID="hdnState" runat="server" Value='<%#Eval("StateCode")%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="SSN">
                                                    <ItemTemplate>
                                                       <asp:Label ID="lblSSN" runat="server" Text='<%#Eval("SSN")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="County">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCounty" runat="server" Text='<%#Eval("County")%>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                
                                            </Columns>
                                        </asp:GridView>
                                        
                                     </td>
                                </tr>
                                <tr>
                                    <td style="height: 30px;">
                                        <br />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td >
                                        <b class="headding2" style="margin-bottom: 0; padding-bottom: 0">
                                            <asp:Label ID="lblChanges" runat="server" style="padding: 10px;"></asp:Label></b>
                                        <asp:Repeater ID="rpt1" runat="server" OnItemDataBound="rpt1_ItemDataBound">
                                            <ItemTemplate>
                                                <div class="Agent1" style="margin-left:10px;">
                                                    <h4>
                                                        <asp:Label ID="lblName" runat="server" Text='<%#Eval("empname")%>'></asp:Label>&nbsp;&nbsp;
                                                        <asp:Label ID="lblEmpID" runat="server" Text='<%#Eval("EmpID")%>'></asp:Label>
                                                    </h4>
                                                    <table>
                                                        <tbody>
                                                            <asp:Repeater ID="repChld" runat="server" OnItemDataBound="repChld_ItemDataBound">
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:Label ID="lblPoint" runat="server"></asp:Label>
                                                                            <asp:Label ID="lblField" runat="server" Text='<%#Eval("FieldName")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblOldvalue" runat="server" Text='<%#Eval("OldValue")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblNewValue" runat="server" Text='<%#Eval("NewValue")%>' Visible="false"></asp:Label>
                                                                            <asp:Label ID="lblChangedDt" runat="server" Text='<%#Bind("ChangeDate","{0:MM/dd/yyyy}") %>'
                                                                                Visible="false"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <br />
                                            </ItemTemplate>
                                           
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnGo" EventName="Click" />
                        </Triggers>
                    </asp:UpdatePanel>
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
       
    </script>

    </form>
</body>
</html>
