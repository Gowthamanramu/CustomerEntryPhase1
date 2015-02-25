<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="VTS.Customer.PL.CustomerDetails" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Customer Details</title>
</head>
<body>
    <form id="frmCustomerDetails" runat="server">
    <div>
        <div>
            <h2>Customer Information</h2>
        </div>
        <div>
            <table>
                <tr>
                    <td><asp:Label ID="lblCustomerId" runat="server" Text="Customer Id"></asp:Label></td>
                    <td><asp:TextBox ID="txtSearch" runat="server"></asp:TextBox></td>
                    <td><asp:Button ID="btnSearch" Text="Search" runat="server" /></td>
                </tr>
                <tr>
                   <td colspan="3"> <asp:GridView ID="grdCustomerDetails" runat="server"></asp:GridView>
                  
                   </td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblTitle" runat="server" Text="Customer Details"></asp:Label></td>
                </tr>
                <tr>
                    <td><asp:Label ID="lblFirstName" runat="server" Text="First Name"></asp:Label></td>
                    <td><asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox></td>
                    <td><asp:Label ID="lblMiddleName" runat="server" Text="Middle Name"></asp:Label></td>
                    <td><asp:TextBox ID="txtMiddleName" runat="server"></asp:TextBox></td>
                    <td><asp:Label ID="lblLastName" runat="server" Text="Last Name"></asp:Label></td>
                    <td><asp:TextBox ID="txtLastName" runat="server"  ></asp:TextBox></td>
                    <td><asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">LinkButton</asp:LinkButton></td>
                    
                    <td>
                    <asp:Calendar ID="Calendar1" Visible="false" runat="server"></asp:Calendar></td>
                </tr>
                <asp:HiddenField ID="HiddenField1" Value="0" runat="server" />
                <tr>
                    <td><asp:Button ID="btnSave" runat="server" Text="Save" />
                  
                    <td><asp:Button ID="btnReset" runat="server" Text="Reset" /></td>
                   
                </tr>
            </table>
           

        </div>
    </div>
    </form>
</body>
</html>
