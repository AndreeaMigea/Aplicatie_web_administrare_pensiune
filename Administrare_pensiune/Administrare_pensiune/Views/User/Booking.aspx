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

        .options-div {
            background-color: #333333;
            border-radius: 10px;
            padding: 10px;
            color: #ffffff;
        }
    </style>
    <div style="display: flex; padding-left: 5px">
        <div class="leftImages" style="flex: 30%">
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
            <div class="slideshow-container" style="width: 750px; display: flex; justify-content: center;">

                <!-- Full-width images with number and caption text -->
                <div class="mySlides ">
                    <div class="numbertext">1 / 8</div>
                    <img src="../../Assets/Images/c1.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 16</div>
                </div>

                <div class="mySlides ">
                    <div class="numbertext">2 / 8</div>
                    <img src="../../Assets/Images/bc1.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 16</div>
                </div>

                <div class="mySlides    ">
                    <div class="numbertext">3 / 8</div>
                    <img src="../../Assets/Images/c2.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 17</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">4 / 8</div>
                    <img src="../../Assets/Images/bc3.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 17</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">5 / 8</div>
                    <img src="../../Assets/Images/c3.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 18</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">6 / 8</div>
                    <img src="../../Assets/Images/bc3.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 18</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">7 / 8</div>
                    <img src="../../Assets/Images/c4.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">ID Camera: 19</div>
                </div>
                <div class="mySlides    ">
                    <div class="numbertext">8 / 8</div>
                    <img src="../../Assets/Images/bc4.jpg" style="width: 100%; height: 85vh; border-radius: 1%">
                    <div class="text">Baie camera ID: 19</div>
                </div>
                <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
                <a class="next" onclick="plusSlides(1)">&#10095;</a>
            </div>
            <br />
            <div class="options-div" id="Bookings">
                <h3 style="color: aqua">Rezervarile dvs:</h3>
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
            <br>
        </div>
        <div class="mainDiv " style="flex: 70%">
            <div style="display: flex; justify-content: space-between;">
                <p style="background-color: #333333; padding: 3px; border-radius: 10px; color: aqua; width: 30%"><span style="color: red; margin-left: 15px; font-size: large; font-weight: 800">!</span> Toate preturile sunt in lei</p>
                <button style="color: #08ee6a; margin-bottom: 5px" class="options-div" type="button" onclick="document.getElementById('Bookings').scrollIntoView();">See your bookings</button>
            </div>
            <div class="options-div">
                <div class="col" style="display: flex">
                    <div style="flex: 1; padding-right: 15px">
                        <!-- <div class="mb-3"> -->
                        <label style="color: aqua" for="RoomTb">Nume</label>
                        <input placeholder="Alege o camera" readonly="readonly" type="text" class="form-control" id="RoomTb" runat="server">
                    </div>
                    <div style="flex: 1;">
                        <label style="color: aqua" for="AmountTb">Pret/Noapte</label>
                        <input name="amountInfo" placeholder="Alege o camera" readonly="readonly" type="text" class="form-control" id="AmountTb" runat="server">
                    </div>

                </div>
                <div style="display: flex">
                    <div style="flex: 1; padding-right: 15px">
                        <label style="color: aqua" for="DateInTb">Date In</label>
                        <input type="date" class="form-control" id="DateInTb" runat="server">
                    </div>
                    <div style="flex: 1;">
                        <label style="color: aqua" for="DateOutTb">Date Out</label>
                        <input type="date" class="form-control" id="DateOutTb" runat="server">
                    </div>
                </div>

            </div>

            <br />
            <div class="options-div">
                <p style="font-size: larger; color: aqua">&nbsp;Opțiuni extra:</p>

                <asp:CheckBox ID="checkBoxMasaInclusa" runat="server" Text="3 mese incluse             " Font-Size="X-Large" TextAlign="Left" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="checkBoxBiclicleta" runat="server" Text="Bicicletă" Font-Size="X-Large" TextAlign="Left" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="checkBoxATV" runat="server" Text="ATV" Font-Size="X-Large" TextAlign="Left" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="checkBoxGhid" runat="server" Text="Ghid drumeție" Font-Size="X-Large" TextAlign="Left" />
                <br />
                <br />
                <a id="continueBtn" href="#" class="button" onclick="showPaymentForm()" role="button" aria-hidden="False" aria-readonly="False">Continua la plata</a>
            </div>


            <div id="paymentForm" style="display: none; padding-bottom: 10px">
                <span class="close-icon" onclick="closePaymentForm()">&#x2716;</span>
                <p>Payment Methods</p>

                <div style="display: flex">
                    <input type="checkbox" id="Text2" runat="server">
                    <span class="checkbox-icon" style="margin: 5px">
                        <img class="paymentIcons" src="../../Assets/Images/atm-card.png" alt="Debit/Credit Card">
                    </span>
                    <label for="Text2">
                        Debit or Credit Card
                    </label>
                </div>
                <div style="display: flex">
                    <input type="checkbox" id="Text3" runat="server">
                    <span class="checkbox-icon " style="margin: 5px">
                        <img style="width:60px;height:60px" src="../../Assets/Images/paypal.png" alt="PayPal">
                    </span>

                </div>

                <div style="display: flex; margin: 5px">
                    <label style="flex: 40%" for="" class="form-label">Card ID</label>
                    <input placeholder="Ex: 4444 4444 4444 4444" type="text" class="form-control" id="Text1" runat="server">
                </div>
                <div style="display: flex; margin: 5px">
                    <label style="flex: 40%" for="Date1" class="form-label">Card expiration date:</label>
                    <input placeholder="12/2023" type="text" class="form-control" id="Date1" maxlength="7">
                </div>
                <div style="display: flex; margin: 5px">
                    <label style="flex: 40%" for="" class="form-label">CCV</label>
                    <input placeholder="Ex: 444" type="text" class="form-control" id="Date2" runat="server">
                </div>
                <div class="text-center" style="padding-top: 15px">
                    <asp:Button ID="BookBtn" runat="server" Text="Pay&Book" class="btn btn-warning" OnClick="BookBtn_Click" />
                </div>
            </div>
            <br />
            <div>
                <div class="options-div">
                    <h3 style="color: aqua">Camere disponibile:</h3>
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

