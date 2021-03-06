﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Back_End/MainSite.Master" AutoEventWireup="true" CodeBehind="YachtsSearch.aspx.cs" Inherits="prjTayanaworld.Back_End.WebForm20" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <!-- page header -->
        <h1 class="page-header">遊艇船型管理</h1>
        <!--end page header -->
    </div>
    <div class="row">
        <!-- Form Elements -->
        <div class="panel panel-default">
            <div class="panel-heading">
                船型編輯與新增
            </div>
            <div class="panel-body">
                <div class="col-lg-12" style="margin-bottom: 1%">
                    <div class="panel-heading" style="background: #5bc0de; color: white">船型列表</div>
                    <asp:GridView ID="gvYachts" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="gvYachts_RowDeleting" CssClass="table table-hover text-center">
                        <Columns>
                            <asp:BoundField DataField="YachtsName" HeaderText="遊艇系列" SortExpression="YachtsName" />
                            <asp:BoundField DataField="Model" HeaderText="遊艇型號" SortExpression="Model" />
                            <asp:BoundField DataField="UploadDate" HeaderText="新增時間" SortExpression="UploadDate" />
                            <asp:TemplateField HeaderText="新船標記">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("NewTypeMark").ToString()=="1" ? "是" : "否" %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ShowHeader="False" HeaderText="編輯遊艇內容">
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text="編輯" class="btn btn-outline btn-primary" NavigateUrl='<%# "YachtsEdit.aspx?id=" + Eval("id") %>'></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="管理遊艇相簿">
                                <ItemTemplate>
                                    <asp:HyperLink ID="HyperLink2" runat="server" class="btn btn-outline btn-success" NavigateUrl='<%# "YachtsEditPhoto.aspx?id=" + Eval("id") %>' Text="管理"></asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="刪除遊艇資料">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" class="btn btn-outline btn-danger" CommandName="Delete" OnClientClick="return confirm('您確定要刪除此遊艇資料，以及其所包含的照片嗎？')" Text="刪除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="text-center">
                        <asp:Label ID="lblError" runat="server" Text="查無資料！" Font-Size="XX-Large" ForeColor="Red" Visible="False"></asp:Label>
                    </div>
                </div>
                <asp:Button ID="btnBack" class="btn btn-success" runat="server" Text="回到遊艇船型管理主頁" Width="30%" OnClick="btnBack_Click" />
            </div>
        </div>
        <!-- End Form Elements -->
    </div>
</asp:Content>
