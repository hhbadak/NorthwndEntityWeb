<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="NorthwndEntityWeb.List" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="Assets/Jquery/scripts/jquery-3.6.4.min.js"></script>
    <link href="Assets/bootstrap-5.3.0/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Assets/Css/Slide.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="product" class="bg-dark text-white text-center">
                <h3>ÜRÜNLERİ LİSTELEMEK İÇİN TIKLAYINIZ..</h3>
            </div>
            <div id="productPanel" style="display: none;">
                <div ng-app="applicationProduct" ng-controller="products">
                    <section class="intro">
                        <div class="gradient-custom-2 h-100">
                            <div class="mask d-flex align-items-center h-100">
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-12">
                                            <div class="table-responsive">
                                                <asp:Repeater ID="rp_productList" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-dark table-bordered mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Ürün Sırası</th>
                                                                    <th>Ürün Adı</th>
                                                                    <th>Kategori Adı</th>
                                                                    <th>Ürün Fotoğrafı</th>
                                                                    <th>Fiyat</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td><%# Eval("ProductID") %></td>
                                                            <td><%# Eval("ProductName") %></td>
                                                            <td><%# Eval("CategoryName") %></td>
                                                            <td>
                                                                <img src='<%# Eval("ImagePath") %>' alt="images" style="width: 100px; height: auto;" />
                                                            </td>
                                                            <td><%# Eval("UnitPrice") %> ₺</td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                    </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
            <div id="category" class="bg-light text-center">
                <h3>KATEGORİLERİ LİSTELEMEK İÇİN TIKLAYINIZ..</h3>
            </div>
            <div id="categoryPanel" style="display: none;">
                <div ng-app="applicationProduct" ng-controller="products">
                    <section class="intro">
                        <div class="gradient-custom-2 h-100">
                            <div class="mask d-flex align-items-center h-100">
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-12">
                                            <div class="table-responsive">
                                                <asp:Repeater ID="rp_categoryList" runat="server">
                                                    <HeaderTemplate>
                                                        <table class="table table-dark table-bordered mb-0">
                                                            <thead>
                                                                <tr>
                                                                    <th>Kategori Sırası</th>
                                                                    <th>Kategori Adı</th>
                                                                    <th>Açıklama</th>
                                                                    <th>Fotoğraf</th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr>
                                                            <td class="text-center"><%# Eval("CategoryID") %></td>
                                                            <td><%# Eval("CategoryName") %></td>
                                                            <td><%# Eval("Description") %></td>
                                                            <td>
                                                                <img src='<%# Eval("Picture") %>' alt="Images" style="width: 100px; height: auto;" /></td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                    </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $('#product').click(function () {
                $('#productPanel').slideToggle();
                $('#product').toggleClass('clicked');
            });

            $('#category').click(function () {
                $('#categoryPanel').slideToggle();
                $('#category').toggleClass('clicked');
            });

            $(document).click(function (event) {
                if (!$(event.target).closest('#product').length) {
                    $('#productPanel').slideUp();
                    $('#product').removeClass('clicked');
                }
                if (!$(event.target).closest('#category').length) {
                    $('#categoryPanel').slideUp();
                    $('#category').removeClass('clicked');
                }
            });
        });
    </script>
</body>

<script src="Assets/bootstrap-5.3.0/js/bootstrap.min.js"></script>
</html>
