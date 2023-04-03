<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Administrare_pensiune.Views.Login" %>

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
    <div class="container-fluid">

        <div class="row" style="height:100px"></div>
            <div class="row">
            <div class="col-md-4"></div>
            <div class="col-md-4 bg-light rounded-3">
                <h1 class="text-success text-center">Pensiune</h1>
                
                <!--//copy bootstrap rister min 25 -->
                <form>
                  <div class="form-group"> <!-- <div class="mb-3"> -->
                    <label for="exampleInputEmail1">Email address</label>
                    <input type="email" class="form-control" id="EmailTb">
                    
                  </div>
                  <div class="form-group">
                    <label for="exampleInputPassword1">Password</label>
                    <input type="password" class="form-control" id="PasswordTb">
                  </div>
                  <div class="form-group">
                    <input type="radio" class="form-check-input" id="AdminCb" value="Admin"><label class="text-success">Admin</label>
                    <input type="radio" class="form-check-input" id="UserCb" value="User"><label class="text-success">User</label>
                  </div>
                        <div class="d-grid">
                            <button type="submit" class="btn btn-success btn-block">Login</button>
                        </div>
                  
                        <br />
               </form>
            </div>
            <div class="col-md-4"></div>
        </div>
    </div>


    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>
