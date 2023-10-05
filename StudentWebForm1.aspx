<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentWebForm1.aspx.cs" Inherits="WebServiceJavaDemo.StudentWebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" language="javascript">
        function GetStudentById() {
            var id = document.getElementById("txtStudentID").value;
            WebServiceJavaDemo.StudentService.GetStudentById(id, GetStudentByIdSuccessCallback,
                GetStudentByIdFailedCallback);
        }
        function GetStudentByIdSuccessCallback(results) {
            document.getElementById("txtName").value = results["Name"];
            document.getElementById("txtGender").value = results["Gender"];
            document.getElementById("txtTotalMarks").value = results["TotalMarks"];
        }
        function GetStudentByIdFailedCallback(error) {
            alert(error.get_message());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
            <Services>
                <asp:ServiceReference Path="~/StudentService.asmx" />
            </Services>
        </asp:ScriptManager>
        <table style="font-family: Arial; border: 1px solid black">
            <tr>
                <td>
                    <b>ID</b>
                </td>
                <td>
                    <asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox>
                    <input id="Button1" type="button" value="Get Student" onclick="GetStudentById()" />
                </td>
            </tr>
            <tr>
                <td>
                    <b>Name</b>
                </td>
                <td>
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Gender</b>
                </td>
                <td>
                    <asp:TextBox ID="txtGender" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <b>Total Marks</b>
                </td>
                <td>
                    <asp:TextBox ID="txtTotalMarks" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <h1>
            Buttona her basıldığında kısmi bir postback gerçekleşir. Sayfanın tamamı gidip gelmez.
        </h1>
        <asp:Label ID="lblTime" runat="server"></asp:Label>
    </form>
</body>
</html>
