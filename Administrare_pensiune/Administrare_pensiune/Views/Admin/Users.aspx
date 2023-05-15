<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="Administrare_pensiune.Views.Admin.Users" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Mybody" runat="server">
    <style>
        .options-div {
            background-color: #333333;
            border-radius: 10px;
            padding: 10px;
            color: #ffffff;
        }
    </style>
    <div class="container-fluid">
        <div class="row">
            <div class="col-4"></div>
            <div class="col-4"></div>
        </div>
        <div class="row" style="margin: 20px">
            <div class="col-md-3 options-div">
                <div>
                    <h2 class=" text-center" style="color: aqua; margin-bottom: 20px">Gestioneaza utilizatorii</h2>
                </div>
                <form>
                    <div class="form-group" style="display: flex; margin: 3px">
                        <!-- <div class="mb-3"> -->
                        <label style="flex: 50%" for="UNameTb" class="form-label">Nume utilizator</label>
                        <input type="text" class="form-control" id="UNameTb" runat="server">
                    </div>

                    <div class="form-group" style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="PhoneTb" class="form-label">Telefon </label>
                        <input type="text" class="form-control" id="PhoneTb" runat="server">
                    </div>
                    <div class="form-group" style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="GenderCb" class="form-label">Gen </label>
                        <asp:DropDownList ID="GenCb" runat="server" CssClass="form-control">
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Female</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="form-group" style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="AddressTb" class="form-label">Adresa </label>
                        <input type="text" class="form-control" id="AddressTb" runat="server">
                    </div>
                    <div class="form-group" style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="PasswordTb" class="form-label">Parola </label>
                        <input type="text" class="form-control" id="PasswordTb" runat="server">
                    </div>
                    <br />
                    <div class="row">
                        <div class="col d-grid" style="margin: 5px">
                            <asp:Button ID="EditBtn" runat="server" Text="Edit" class="btn btn-warning btn-block" OnClick="EditBtn_Click" />
                        </div>
                        <div class="col d-grid" style="margin: 5px">
                            <asp:Button ID="DeleteBtn" runat="server" Text="Sterge" class="btn btn-danger btn-block" OnClick="DeleteBtn_Click" />
                        </div>
                    </div>

                    <div class="d-grid" style="margin: 5px">
                        <label id="ErrMsg" runat="server" class="text-danger"></label>

                        <asp:Button ID="SaveBtn" runat="server" Text="Adauga" class="btn btn-success btn-block" OnClick="SaveBtn_Click" />
                    </div>


                    <br />
                </form>
            </div>
            <div class="col-md-9 ">
                <div class="col options-div" style="margin-bottom: 5px">
                    <h1 style="color: aqua" class="text-center">Utilizatori inregistrati</h1>
                </div>
                <div class="options-div">
                    <asp:GridView ID="UserGV" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="UserGV_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
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

</asp:Content>
