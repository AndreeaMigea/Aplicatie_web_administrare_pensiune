<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="Administrare_pensiune.Views.Admin.Categories" EnableEventValidation="false" %>

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
            <div class="col-md-5"></div>
            <div class="col-md-5"></div>
            <div class="col-md-2">
                <label id="LogedUser" runat="server" class="text-success"></label>
            </div>
        </div>

        <div class="row" style="margin: 20px">
            <div class="col-md-3 options-div">
                <div>
                    <h2 class=" text-center" style="color: aqua; margin-bottom: 20px">Gestioneaza categoriile</h2>
                </div>
                <form>
                    <br />
                    <div style="display: flex; margin: 5px" class="form-group">
                        <label style="flex: 50%" for="CatNameTb" class="form-label">Nume cat.</label>
                        <input type="text" class="form-control" id="CatNameTb" runat="server">
                    </div>
                    <br />

                    <div style="display: flex; margin: 5px" class="form-group">
                        <label style="flex: 50%" for="RemarksTb" class="form-label">Detalii </label>
                        <input type="text" class="form-control" id="RemarksTb" runat="server">
                    </div>
                    <br />
                    <br />

                    <div class="row">
                        <div class="col d-grid" style="margin: 5px">
                            <asp:Button ID="EditBtn" runat="server" Text="Edit" class="btn btn-warning btn-block" OnClick="Button1_Click" />
                        </div>
                        <div class="col d-grid" style="margin: 5px">
                            <asp:Button ID="DeleteBtn" runat="server" Text="Sterge" class="btn btn-danger btn-block" OnClick="DeleteBtn_Click" />
                        </div>
                    </div>

                    <div class="d-grid" style="margin: 5px">
                        <label id="ErrMsg" runat="server" class="text-danger"></label>

                        <asp:Button ID="SaveBtn" runat="server" Text="Adauga" class="btn btn-success btn-block" OnClick="SaveBtn_Click" />
                    </div>
                </form>
            </div>
            <div class="col-md-9 ">
                <div class="col options-div" style="margin-bottom: 5px">
                    <h1 style="color: aqua" class="text-center">Categorii disponibile</h1>
                </div>
                <div class="options-div">
                    <asp:GridView ID="CategoriesGV" runat="server" class="table" CellPadding="4" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="CategoriesGV_SelectedIndexChanged">
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
</asp:Content>
