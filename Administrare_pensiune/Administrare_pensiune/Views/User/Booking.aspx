<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/UserMaster.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="Administrare_pensiune.Views.User.Booking" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <style>
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
            background-color: #333;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3);
            color: #fff;
        }
    </style>

    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <div class="row">
                    <div class="col">
                        <div class="row">
                            <div class="col">
                                <div class="form-group">
                                    <!-- <div class="mb-3"> -->
                                    <label for="RoomTb" class="form-label">Room</label>
                                    <input placeholder="Room name will be displayed here" readonly="readonly" type="text" class="form-control" id="RoomTb" runat="server">
                                </div>
                                <div class="form-group">
                                    <label for="AmountTb" class="form-label">Amount</label>
                                    <input name="amountInfo" placeholder="Room price will be displayed here" readonly="readonly" type="text" class="form-control" id="AmountTb" runat="server">
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


                        <br />
                        <div style="padding-bottom: 10px">

                            <a id="continueBtn" href="#" class="button" onclick="showPaymentForm()" role="button">Continue to payment</a>


                        </div>
                        <div id="paymentForm" class="row" style="display: none; padding-bottom: 10px">
                            <div class="col">
                                <div class="form-group">
                                    <!-- <div class="mb-3"> -->
                                    <label for="" class="form-label">Card ID</label>
                                    <input placeholder="Ex: 4444 4444 4444 4444" type="text" class="form-control" id="Text1" runat="server">
                                </div>
                                <div class="form-group">
                                    <label for="Date1" class="form-label">Card expiration date:</label>
                                    <input placeholder="12/2023" type="text" class="form-control" id="Date1" maxlength="7">
                                </div>
                            </div>
                            <div class="col">
                                <div class="form-group">
                                    <label for="" class="form-label">CCV</label>
                                    <input placeholder="Ex: 444" type="text" class="form-control" id="Date2" runat="server">
                                </div>

                            </div>

                            <label id="ErrMsg" runat="server" class="text-danger"></label>
                            <asp:Button ID="BookBtn" runat="server" Text="Pay&Book" class="btn btn-warning" OnClick="BookBtn_Click" />

                        </div>

                    </div>
                </div>
            </div>
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
        <div class="col">
            <div class="row">
                <div class="col"></div>
                <div class="col">
                    <h1 class="text-primary">Room&#39;s booked</h1>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <br />
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

