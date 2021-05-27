using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class doctoIdentificacionData
    {

        public static bool RegistrarDocto(doctoIdentificacion ndoctoPersona)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_registrardoctoIdentificacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idSubTipoDocto", ndoctoPersona.idsubtipodoc);
                cmd.Parameters.AddWithValue("@numero", ndoctoPersona.numero);
                cmd.Parameters.AddWithValue("@fechaEmision", ndoctoPersona.fechaemision);
                cmd.Parameters.AddWithValue("@fechaVencimiento", ndoctoPersona.fechavencimiento);
                cmd.Parameters.AddWithValue("@activo", ndoctoPersona.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", ndoctoPersona.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", ndoctoPersona.fechaIng.Date);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ndoctoPersona.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", ndoctoPersona.fechaAct);

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

        public static List<doctoIdentificacion> Listartipodocto()
        {
            List<doctoIdentificacion> oListaUsuario = new List<doctoIdentificacion>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listartipodoc", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new doctoIdentificacion()
                            {
                                idtipodoc = Convert.ToInt32(dr["idDoctoIdentificacion"]),
                                idsubtipodoc = Convert.ToInt32(dr["idSubTipoDocto"]),
                                numero = dr["numero"].ToString(),
                                fechaemision = Convert.ToDateTime(dr["fechaemision"]),
                                fechavencimiento = Convert.ToDateTime(dr["fechavencimiento"]),
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
        public static doctoIdentificacion Obtenertipodocid(int iddoctoper)
        {
            doctoIdentificacion ntipodoc = new doctoIdentificacion();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerdoctoIdentificacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idtipodoc", iddoctoper);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ntipodoc = new doctoIdentificacion()
                            {
                                idtipodoc = Convert.ToInt32(dr["idDoctoIdentificacion"]),
                                idsubtipodoc = Convert.ToInt32(dr["idSubTipoDocto"]),
                                numero = dr["numero"].ToString(),
                                fechaemision = Convert.ToDateTime(dr["fechaemision"]),
                                fechavencimiento = Convert.ToDateTime(dr["fechavencimiento"]),
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

        public static bool Modificartipodoc(doctoIdentificacion ntipodoc)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_modificardoctoIdentificacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idDoc", ntipodoc.idtipodoc);
                cmd.Parameters.AddWithValue("@numero", ntipodoc.numero);
                cmd.Parameters.AddWithValue("@activo", ntipodoc.activo);
                cmd.Parameters.AddWithValue("@idUsuarioAct", ntipodoc.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", ntipodoc.fechaAct);
                

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

        public static bool EliminarTipoDoc(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_eliminardoctoIdentificacion", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idDoc", id);

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
