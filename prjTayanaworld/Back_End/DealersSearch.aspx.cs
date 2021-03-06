﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace prjTayanaworld.Back_End
{
    public partial class WebForm21 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getGridView();
            }
        }

        private void getGridView()
        {
            string sql = Session["keyword"].ToString();
            string ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //連接資料庫
            SqlConnection Conn = new SqlConnection(ConnectionString);
            Conn.Open();
            // SqlDataAdapter 執行SQL命令抓取資料
            SqlDataAdapter Adapter = new SqlDataAdapter(sql, Conn);
            //using System.Data;
            //宣告DataTable 將SqlDataAdapter匯入，DataBind將資料來源繫結至 GridView
            DataTable dataTable = new DataTable();
            Adapter.Fill(dataTable);
            gvRegion.DataSource = dataTable;
           gvRegion.DataBind();
            if (dataTable.Rows.Count == 0)
            {
                lblError.Visible = true;
            }
            //關閉SQL連接
            Conn.Close();
        }

        protected void gvRegion_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = gvRegion.DataKeys[e.RowIndex].Value.ToString();
            string ConnectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            //連接資料庫
            SqlConnection Conn = new SqlConnection(ConnectionString);
            Conn.Open();
            SqlCommand Cmd = new SqlCommand("DELETE FROM DealersDetails WHERE id = @id;", Conn);
            Cmd.Parameters.AddWithValue("@id", id);

            Cmd.ExecuteNonQuery();

            Cmd.Cancel();
            Conn.Close();
            Conn.Dispose();
            Response.Redirect(this.Request.Url.ToString());//頁面跳轉更新
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            BackToPreviousPage();
        }

        private void BackToPreviousPage()
        {
            string id = Server.HtmlDecode(Request.Cookies["id"].Value);
            Response.Redirect($"DealersList.aspx?id={id}");//回到上頁，且回傳ContinentID的值
        }
    }
}