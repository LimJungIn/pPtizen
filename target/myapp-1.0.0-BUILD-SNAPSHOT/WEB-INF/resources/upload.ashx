<%@ WebHandler Language="C#" Class="Upload" %>

using System;

using System.Web;

public class Upload : IHttpHandler

{

    public void ProcessRequest(HttpContext context)

    {

        HttpPostedFile uploads = context.Request.Files["upload"];

        string CKEditorFuncNum = context.Request["CKEditorFuncNum"];

        string file = System.IO.Path.GetFileName(uploads.FileName);

        uploads.SaveAs(context.Server.MapPath(".") + "\\Img\\" + file);

        string url = "/img/" + file;

        context.Response.Write(string.Format("<script>window.parent.CKEDITOR.tools.callFunction('{0}', '{1}', '')</script>", CKEditorFuncNum, url));

        context.Response.End();       

    }

    public bool IsReusable

    {

        get

        {

            return false;

        }

    }

}