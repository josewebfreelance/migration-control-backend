using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class tipoDoctoData
    {
        public static bool addTipoDocto(tipoDocto ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_registrar_tipoDocto", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@nombre", ntipdoc.nombre);
                cmd.Parameters.AddWithValue("@activo", ntipdoc.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", ntipdoc.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", ntipdoc.fechaIng.Date);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ntipdoc.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", ntipdoc.fechaAct);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }

            }
        }

        public static List<tipoDocto> Listartipodocto()
        {
            List<tipoDocto> oListaUsuario = new List<tipoDocto>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listipodoc", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new tipoDocto()
                            {
                                id = Convert.ToInt32(dr["idTipoDocto"]),
                                nombre = dr["nombre"].ToString(),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),




                            });
                        }

                    }



                    return oListaUsuario;
                }
                catch (Exception ex)
                {
                    return oListaUsuario;
                }
            }
        }
        public static tipoDocto ObtenertdocID(int idsubd)
        {
            tipoDocto ntipodoc = new tipoDocto();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listdocID", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtipod", idsubd);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ntipodoc = new tipoDocto()
                            {

                                id = Convert.ToInt32(dr["idTipoDocto"]),
                                nombre = dr["nombre"].ToString(),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),

                            };
                        }

                    }



                    return ntipodoc;
                }
                catch (Exception ex)
                {
                    return ntipodoc;
                }
            }
        }

        public static bool edittiDoc(tipoDocto ntipdoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_edit_tipoDocto", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtDoc", ntipdoc.id);
                cmd.Parameters.AddWithValue("@nombre", ntipdoc.nombre);
                cmd.Parameters.AddWithValue("@activo", ntipdoc.activo);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ntipdoc.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", ntipdoc.fechaAct);


                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }
        }

        public static bool deltiDoc(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_DELtipoDocto", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtDoc", id);

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();
                    return true;
                }
                catch (Exception ex)
                {
                    return false;
                }
            }

        }
    }
}
