using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class doctoPersonaData
    {
        public static bool RegistrarDoctopersona(doctoPersona ndoctoPersona)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_registrardoctopersona", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idDoctoIdentificacion", ndoctoPersona.idDoctoidentificacion);
                cmd.Parameters.AddWithValue("@idPersona", ndoctoPersona.idPersona);
                cmd.Parameters.AddWithValue("@activo", ndoctoPersona.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", ndoctoPersona.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", ndoctoPersona.fechaIng);
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

        public static List<doctoPersona> Listardoctopersona()
        {
            List<doctoPersona> oListaUsuario = new List<doctoPersona>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_listardoctoPersona", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new doctoPersona()
                            {
                                idDoctopersona = Convert.ToInt32(dr["idDoctopersona"]),
                                idDoctoidentificacion = Convert.ToInt32(dr["idDoctoidentificacion"]),
                                idPersona = Convert.ToInt32(dr["idPersona"]),
                                activo =dr["activo"].ToString(),
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

        public static doctoPersona Obtenerdoctopersonaid(int iddoctoper)
        {
            doctoPersona ndoctoPersona = new doctoPersona();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_obtenerdoctopersonaid", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@iddoctopersona", iddoctoper);

                try
                {
                    oConexion.Open();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            ndoctoPersona = new doctoPersona()
                            {
                                idDoctopersona = Convert.ToInt32(dr["idDoctopersona"]),
                                idDoctoidentificacion = Convert.ToInt32(dr["idDoctoidentificacion"]),
                                idPersona = Convert.ToInt32(dr["idPersona"]),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"]),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"]),
                            };
                        }

                    }



                    return ndoctoPersona;
                }
                catch (Exception ex)
                {
                    return ndoctoPersona;
                }
            }
        }

        public static bool ModificardoctoPer(doctoPersona ndoctoPersona)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_modificardoctopersona", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@iddoctopersona", ndoctoPersona.idDoctopersona);
                cmd.Parameters.AddWithValue("@activo", ndoctoPersona.activo);
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

        public static bool Eliminardoctoper(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_eliminardoctopersona", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@iddoctopersona", id);

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
