<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Administrare_pensiune.Views.Login" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/Libraries/Bootstrap/css/bootstrap.min.css"/>
    <style>
        body{
            /* background image:url(../Assets/Images/1.jpg);*/
             background-color:rgba(155, 255, 212, 0.5);
        }
        .container-fluid{
            opacity:0.7; /*cat de vizibil e chenarul de login*/
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="container-fluid">

        <div class="row" style="height:100px"></div>
            <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 bg-light rounded-3">
                <h1 class="text-success text-center">Pensiune</h1>
                
                <!--//copy bootstrap rister min 25 -->
                <form>
                  <div class="form-group"> <!-- <div class="mb-3"> -->
                    <label for="EmailTb">Email address</label>
                    <input type="text" class="form-control" id="UserTb" runat="server" required="required">
                    
                  </div>
                  <div class="form-group">
                    <label for="PasswordTb">Password</label>
                    <input type="password" class="form-control" id="PasswordTb" runat="server" required="required">
                  </div>
                  <div class="form-group">
                      <label id="ErrMsg" class="text-danger" runat="server"></label>
                    <input type="radio" id="AdminCb" runat="server" name="Role" checked=""><label class="text-success">Admin</label>
                    <input type="radio" id="UserCb" runat="server" name="Role"><label class="text-success">User</label>
                  </div>

                        <div class="d-grid">
                            <asp:Button ID="LoginBtn" runat="server" Text="Login" class="btn btn-success btn-block" OnClick="LoginBtn_Click"/>
                        </div>
                  
                        <br />
               </form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>
        </div>
    </form>
</body>
</html>
