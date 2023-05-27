<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Rooms.aspx.cs" Inherits="Administrare_pensiune.Rooms" EnableEventValidation="false" %>

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
    <!-- <h1 class="text-success">Manage Rooms</h1> -->
    <div class="container-fluid">



        <div class="row" style="margin: 20px">
            <div class="col-md-3 options-div">
                <div>
                    <h2 class=" text-center" style="color: aqua; margin-bottom: 20px">Gestioneaza camere</h2>
                </div>
                <form>
                    <div style="display: flex; margin: 3px">
                        <!-- <div class="mb-3"> -->
                        <label style="flex: 50%" for="RNameTb" class="form-label">Nume</label>
                        <input type="text" class="form-control" id="RNameTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="CatCb" class="form-label">Categorie</label>
                        <asp:DropDownList ID="CatCb" runat="server" class="form-control"></asp:DropDownList>
                        <!--dropdownlist din toolbox -->
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="LocationTb" class="form-label">Locatie</label>
                        <input type="text" class="form-control" id="LocationTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="CostTb" class="form-label">Pret</label>
                        <input type="text" class="form-control" id="CostTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="RemarksTb" class="form-label">Facilitati</label>
                        <input type="text" class="form-control" id="RemarksTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="CatCb" class="form-label">Status</label>
                        <asp:DropDownList ID="StatusCb" runat="server" class="form-control">
                            <asp:ListItem>Available</asp:ListItem>
                            <asp:ListItem>Not Available</asp:ListItem>

                        </asp:DropDownList>
                    </div>


                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="PriceATV" class="form-label">PretAtv</label><input type="text" class="form-control" id="PriceAtvTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" for="CostTb0" class="form-label">PretBicicleta</label><input type="text" class="form-control" id="PriceBicycleTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" class="form-label">Pret3Mese</label><input type="text" class="form-control" id="Price3MealsTb" runat="server" required="required">
                    </div>
                    <div style="display: flex; margin: 3px">
                        <label style="flex: 50%" class="form-label">PretGhid</label><input type="text" class="form-control" id="PriceGuideTb" runat="server" required="required">
                    </div>
                    <br />
                    <div class="col d-grid" style="margin: 5px">
                        <asp:Button ID="EditBtn" runat="server" Text="Edit" class="btn btn-warning btn-block" OnClick="EditBtn_Click" />
                    </div>

                    <div class="col d-grid" style="margin: 5px">
                        <asp:Button ID="DeleteBtn" runat="server" Text="Sterge" class="btn btn-danger btn-block" OnClick="DeleteBtn_Click" />
                    </div>

                    <div class="d-grid" style="margin: 5px">
                        <label id="ErrMsg" runat="server" class="text-danger"></label>
                        <asp:Button ID="SaveBtn" runat="server" Text="Adauga" class="btn btn-success btn-block" OnClick="SaveBtn_Click" />
                    </div>
                </form>
            </div>
            <div class="col-md-9">
                <div class="col options-div" style="margin-bottom: 5px">
                    <h1 style="color: aqua" class="text-center">Camere disponibile</h1>
                </div>
                <div class="options-div">
                    <asp:GridView ID="RoomsGV" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateSelectButton="True" OnSelectedIndexChanged="RoomsGV_SelectedIndexChanged">
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
                <br />
                <div class="col options-div" style="margin-bottom: 5px">
                    <h1 style="color: aqua" class="text-center">Camere rezervate</h1>
                </div>
                <div class="container-fluid options-div">
                    <div class="row">
                        <div class="col">
                            <div class="row">
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
                <br />
            </div>
        </div>

    </div>
</asp:Content>
