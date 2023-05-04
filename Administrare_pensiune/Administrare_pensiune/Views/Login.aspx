<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Administrare_pensiune.Views.Login" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="../Assets/Libraries/Bootstrap/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="../Assets/Libraries/Bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../Assets/CSS/login.css" />
    <script>
        let slideIndex = 1;
        showSlides(slideIndex);

        // Next/previous controls
        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        // Thumbnail image controls
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }

        function showSlides(n) {
            let i;
            let slides = document.getElementsByClassName("mySlides");
            let dots = document.getElementsByClassName("dot");
            if (n > slides.length) { slideIndex = 1 }
            if (n < 1) { slideIndex = slides.length }
            for (i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }
            for (i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }
            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }
        function showRegisterForm() {
            // get references to the login and register forms
            var loginForm = document.getElementById('login-form');
            var registerForm = document.getElementById('register-form');

            // hide the login form and show the register form
            loginForm.style.display = 'none';
            registerForm.style.display = '';

        }
        function showLoginForm() {
            var loginForm = document.getElementById('login-form');
            var registerForm = document.getElementById('register-form');

            // hide the register form and show the login form
            registerForm.style.display = 'none';
            loginForm.style.display = '';
        }
    </script>


    <style>
       
    </style>
</head>

<body onload="showSlides(slideIndex)">
    <form id="form1" runat="server">
        <div class="container-fluid" style="display: flex; padding-top: 20vh">

            <!-- Slideshow container -->
            <div class="slideshow-container" style="width: 1200px">
                <div>
                </div>
                <!-- Full-width images with number and caption text -->
                <div class="mySlides ">
                    <div class="numbertext">1 / 3</div>
                    <img src="../Assets/Images/pensiune1.jpg" style="width: 100%; border-radius: 1%">
                    <div class="text">Pensiune</div>
                </div>

                <div class="mySlides ">
                    <div class="numbertext">2 / 3</div>
                    <img src="../Assets/Images/pensiune2.jpg" style="width: 100%; border-radius: 1%">
                    <div class="text">Rau</div>
                </div>

                <div class="mySlides    ">
                    <div class="numbertext">3 / 3</div>
                    <img src="../Assets/Images/pensiune3.jpg" style="width: 100%; border-radius: 1%">
                    <div class="text">Vedere de sus</div>
                </div>

                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <br>

            <div style="text-align: center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
            </div>

            <div class="container d-flex justify-content-center">

                <div style="padding-top: 20vh">
                    <h1 class="display-1">Administrare Pensiune</h1>

                    <div class="row" style="height: 70px"></div>

                    <h1 style="padding-bottom: 10px">Welcome</h1>
                    <p>
                <label id="ErrMsg" class="text-danger" runat="server"></label>
                    </p>
                    <p>Log in to see the rooms that we have available. If you don't have an account, feel free to create one.</p>
                    <button class="btn btn-primary" type="button" onclick="document.getElementById('login-form').scrollIntoView();">Press here for the login form</button>
                </div>
            </div>

        </div>
        <div class="row" id="login-form" style="padding-top: 20vh; padding-bottom: 5vh; justify-content: center; align-items: center">

            <div style="width: auto">
                <label for="EmailTb">Email address</label>
                <input type="text" class="form-control" id="UserTb" runat="server" required="required" />

                <label for="PasswordTb">Password</label>
                <input type="password" class="form-control" id="PasswordTb" runat="server" required="required" />
                <input type="radio" id="AdminCb" runat="server" name="Role" checked="" /><label class="text-success">Admin</label>
                <input type="radio" id="UserCb" runat="server" name="Role" /><label class="text-success">User</label>

                <div class="d-grid">
                    <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-primary btn-block" OnClick="LoginBtn_Click" />
                </div>
                <a href="#" onclick="showRegisterForm()">Don't have an account? Register here.</a>


                <br />
            </div>
        </div>
        <div class="row" id="register-form" style="padding-top: 20vh; padding-bottom: 5vh; justify-content: center; align-items: center; display: none">
            <div style="width: auto">

                <div class="form-group">
                    <!-- <div class="mb-3"> -->
                    <label for="UNameTb" class="form-label">Email address</label>
                    <input type="text" class="form-control" id="UNameTb" runat="server" />
                </div>


                <div style="padding-bottom: 15px" class="form-group">
                    <label for="PasswordTb" class="form-label">Password </label>
                    <input type="password" class="form-control" id="PasswordTb0" runat="server" />
                </div>

                <asp:Label ID="Label2" runat="server" Text="Phone"></asp:Label>

                <div class="form-group">
                    <input type="text" class="form-control" id="PhoneTb0" runat="server">
                </div>
                <div class="form-group">
                    <label for="GenderCb" class="form-label">Gender </label>
                    <asp:DropDownList ID="GenCb0" runat="server" CssClass="form-control">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label for="AddressTb0" class="form-label">Address </label>
                    <input type="text" class="form-control" id="AddressTb0" runat="server">
                </div>
                <div class="d-grid" style="padding-top:10px">
                    <label id="Label1" runat="server" class="text-danger"></label>
                    <asp:Button ID="SaveBtn" runat="server" Text="Register" class="btn btn-primary btn-block" OnClick="SaveBtn_Click" />
                </div>
                <a href="#" onclick="showLoginForm()">Already have an account? Log in here.</a>
                <div style="width: auto">
                </div>
            </div>
        </div>
    </form>

</body>
</html>
