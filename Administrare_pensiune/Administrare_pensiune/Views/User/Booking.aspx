<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Administrare_pensiune.Views.User.Booking" EnableEventValidation="false" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">

    <style>
        body {
        }

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        #paymentForm {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 9999;
            background-color: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 50px rgba(0, 0, 0, 0.5);
            color: #000f;
        }

            #paymentForm .close-icon {
                position: absolute;
                top: 10px;
                right: 10px;
                font-size: 16px;
                cursor: pointer;
            }

        .paymentIcons {
            width: 30px;
            height: 30px;
        }

        .checkbox-group {
            display: flex;
            flex-direction: column;
        }

        .mainDiv {
            padding: 10px;
        }

        .carousel-item img {
            object-fit: cover;
            width: 70%;
            height: 70%;
        }

        * {
            box-sizing: border-box
        }

        /* Slideshow container */
        .slideshow-container {
            max-width: 1000px;
            position: relative;
            margin: auto;
        }



        /* Next & previous buttons */
        .prev, .next {
            cursor: pointer;
            position: absolute;
            top: 50%;
            width: auto;
            margin-top: -22px;
            padding: 16px;
            color: black;
            font-weight: bold;
            font-size: 18px;
            transition: 0.6s ease;
            border-radius: 0 3px 3px 0;
            user-select: none;
        }

        /* Position the "next button" to the right */
        .next {
            right: 0;
            border-radius: 3px 0 0 3px;
        }

        .prev {
            left: 0;
        }

            /* On hover, add a black background color with a little bit see-through */
            .prev:hover, .next:hover {
                background-color: rgba(0,0,0,0.2);
            }

        /* Caption text */
        .text {
            color: white;
            font-size: 25px;
            padding: 8px 12px;
            position: absolute;
            bottom: 8px;
            width: 100%;
            font-weight: 300;
            text-align: left;
        }

        /* Number text (1/3 etc) */
        .numbertext {
            color: #f2f2f2;
            font-size: 12px;
            padding: 8px 12px;
            position: absolute;
            top: 0;
        }

        /* The dots/bullets/indicators */
        .dot {
            cursor: pointer;
            height: 15px;
            width: 15px;
            margin: 0 2px;
            background-color: #bbb;
            border-radius: 50%;
            display: inline-block;
            transition: background-color 0.6s ease;
        }

            .active, .dot:hover {
                background-color: #717171;
            }

        /* Fading animation */
        .fade {
            animation-name: fade;
            animation-duration: 1.5s;
        }

        .mySlides {
            display: none;
            margin: 0 auto;
        }

        @keyframes fade {
            from {
                opacity: .4
            }

            to {
                opacity: 1
            }
        }
    </style>
    <div style="display: flex">
        <div class="leftImages" style="flex: 40%">
            <div style="text-align: center">
                <span class="dot" onclick="currentSlide(1)"></span>
                <span class="dot" onclick="currentSlide(2)"></span>
                <span class="dot" onclick="currentSlide(3)"></span>
                <span class="dot" onclick="currentSlide(4)"></span>
                <span class="dot" onclick="currentSlide(5)"></span>
                <span class="dot" onclick="currentSlide(6)"></span>
                <span class="dot" onclick="currentSlide(7)"></span>
                <span class="dot" onclick="currentSlide(8)"></span>

            </div>
            <div class="slideshow-container" style="width: 1200px; display: flex; justify-content: center;">

                <!-- Full-width images with number and caption text -->
                <div class="mySlides ">
                    <div class="numbertext">1 / 8</div>
                    <img src="../../Assets/Images/c1.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 10</div>
                </div>

                <div class="mySlides ">
                    <div class="numbertext">2 / 8</div>
                    <img src="../../Assets/Images/bc1.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 11</div>
                </div>

                <div class="mySlides    ">
                    <div class="numbertext">3 / 8</div>
                    <img src="../../Assets/Images/c2.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 11</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">4 / 8</div>
                    <img src="../../Assets/Images/bc3.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 11</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">5 / 8</div>
                    <img src="../../Assets/Images/c3.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 12</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">6 / 8</div>
                    <img src="../../Assets/Images/bc3.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 12</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">7 / 8</div>
                    <img src="../../Assets/Images/c4.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 13</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">8 / 8</div>
                    <img src="../../Assets/Images/bc4.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 13</div>
                </div>
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>

            <br>
        </div>
        <div class="mainDiv" style="flex: 60%">
            <div>
                <div class="col">
                    <div class="form-group">
                        <!-- <div class="mb-3"> -->
                        <label for="RoomTb" class="form-label">Room</label>
                        <input placeholder="Room name will be displayed here" readonly="readonly" type="text" class="form-control" id="RoomTb" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="AmountTb" class="form-label">Price/night</label>
                        <input name="amountInfo" placeholder="Room price/night will be displayed here" readonly="readonly" type="text" class="form-control" id="AmountTb" runat="server">
                    </div>

                </div>
                <div class="col">
                    <div class="form-group">
                        <label for="DateInTb" class="form-label">Date In</label>
                        <input type="date" class="form-control" id="DateInTb" runat="server">
                    </div>
                    <div class="form-group">
                        <label for="DateOutTb" class="form-label">Date Out</label>
                        <input type="date" class="form-control" id="DateOutTb" runat="server">
                    </div>

                </div>
            </div>


            <div style=" padding-top: 10px">
                <a id="continueBtn" href="#" class="button" onclick="showPaymentForm()" role="button">Continue to payment</a>
            </div>


            <div id="paymentForm" style="display: none; padding-bottom: 10px">
                <span class="close-icon" onclick="closePaymentForm()">&#x2716;</span>
                <p>Payment Methods</p>
                <div class="checkbox-group">
                    <div>
                        <input type="checkbox" id="Text2" runat="server">
                        <label for="Text2" class="form-label">
                            <span class="checkbox-icon">
                                <img class="paymentIcons" src="../../Assets/Images/atm-card.png" alt="Debit/Credit Card">
                            </span>
                            Debit or Credit Card
                        </label>
                    </div>
                    <div>
                        <input type="checkbox" id="Text3" runat="server">
                        <label for="Text3" class="form-label">
                            <span class="checkbox-icon">
                                <img class="paymentIcons" src="../../Assets/Images/paypal.png" alt="PayPal">
                            </span>
                            PayPal
                        </label>
                    </div>
                </div>
                <label for="" class="form-label">Card ID</label>
                <input placeholder="Ex: 4444 4444 4444 4444" type="text" class="form-control" id="Text1" runat="server">
                <label for="Date1" class="form-label">Card expiration date:</label>
                <input placeholder="12/2023" type="text" class="form-control" id="Date1" maxlength="7">
                <label for="" class="form-label">CCV</label>
                <input placeholder="Ex: 444" type="text" class="form-control" id="Date2" runat="server">
             
                <div class="text-center" style="padding-top: 15px">
                    <asp:Button ID="BookBtn" runat="server" Text="Pay&Book" class="btn btn-warning" OnClick="BookBtn_Click" />
                </div>
            </div>

            <div>
                <div>
                    <h3 class="text-primary">Available rooms</h3>
                    <asp:GridView ID="RoomsGV" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="RoomsGV_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Select"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>


                <div>
                    <h3 class="text-primary">Rooms booked by you</h3>
                    <asp:GridView ID="BookingGV" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="BookingGV_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="Cancel booking"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EditRowStyle BackColor="#7C6F57" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#E3EAEB" />
                        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <script>
        const dateInput = document.getElementById('Date1');
        const amount = document.getElementById('AmountTb');
        dateInput.addEventListener('input', function (event) {
            // Remove any non-numeric characters from the input
            const sanitizedValue = event.target.value.replace(/\D/g, '');

            // Format the input as "MM/YYYY"
            const formattedValue = sanitizedValue.replace(/^(\d{2})(\d{0,4})$/, '$1/$2');

            // Update the input value with the formatted value
            event.target.value = formattedValue;
        });
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
            var slides = document.getElementsByClassName("mySlides");
            var dots = document.getElementsByClassName("dot");

            if (n > slides.length) {
                slideIndex = 1;
            }

            if (n < 1) {
                slideIndex = slides.length;
            }

            for (var i = 0; i < slides.length; i++) {
                slides[i].style.display = "none";
            }

            for (var i = 0; i < dots.length; i++) {
                dots[i].className = dots[i].className.replace(" active", "");
            }

            slides[slideIndex - 1].style.display = "block";
            dots[slideIndex - 1].className += " active";
        }
        function currentSlide(n) {
            showSlides(slideIndex = n);
        }
        function closePaymentForm() {
            document.getElementById('paymentForm').style.display = 'none';
        }
        function showPaymentForm() {
            // get references to the login and register forms
            var loginForm = document.getElementById('paymentForm');
            var bookBtn = document.getElementById('book-btn');

            // hide the login form and show the register form
            loginForm.style.display = 'block';
            bookBtn.style.display = 'block';
            

           

        }
    </script>
</asp:Content>

