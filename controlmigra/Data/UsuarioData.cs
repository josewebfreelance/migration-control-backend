using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class UsuarioData
    {
        public static bool Registrar(Usuario oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_registrarpersona", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@primerNombre", oUsuario.primerNombre);
                cmd.Parameters.AddWithValue("@segundoNombre", oUsuario.segundoNombre);
                cmd.Parameters.AddWithValue("@tercerNombre", oUsuario.tercerNombre);
                cmd.Parameters.AddWithValue("@primerApellido", oUsuario.primerApellido);
                cmd.Parameters.AddWithValue("@segundoApellido", oUsuario.segundoApellido);
                cmd.Parameters.AddWithValue("@apellidoCasada", oUsuario.apellidoCasada);
                cmd.Parameters.AddWithValue("@fechaNac", oUsuario.fechaNac);
                cmd.Parameters.AddWithValue("@idGenero", oUsuario.idGenero);
                cmd.Parameters.AddWithValue("@idOcupacion", oUsuario.idOcupacion);
                cmd.Parameters.AddWithValue("@idPaisNacimiento", oUsuario.idPaisNacimiento);
                cmd.Parameters.AddWithValue("@idPaisNacionalidad", oUsuario.idPaisNacionalidad);
                cmd.Parameters.AddWithValue("@idPaisResidencia", oUsuario.idPaisResidencia);
                cmd.Parameters.AddWithValue("@activo", oUsuario.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", oUsuario.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", oUsuario.fechaIng);
                cmd.Parameters.AddWithValue("@idUsuarioAct", oUsuario.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", oUsuario.fechaAct);

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

        public static Usuario Obtener(int idpersona)
        {
            Usuario oUsuario = new Usuario();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_obtener", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idusuario", idpersona);

                try
                {
                    oConexion.Open();
                   
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oUsuario = new Usuario()
                            {
                                id = Convert.ToInt32(dr["idPersona"]),
                                primerNombre = dr["primerNombre"].ToString(),
                                segundoNombre = dr["segundoNombre"].ToString(),
                                tercerNombre = dr["tercerNombre"].ToString(),
                                primerApellido = dr["primerApellido"].ToString(),
                                segundoApellido = dr["segundoApellido"].ToString(),
                                apellidoCasada = dr["apellidoCasada"].ToString(),
                                fechaNac = Convert.ToDateTime(dr["fechaNac"].ToString()),
                                idGenero = Convert.ToInt32(dr["idGenero"]),
                                idOcupacion = Convert.ToInt32(dr["idOcupacion"]),
                                idPaisNacimiento = Convert.ToInt32(dr["idPaisNacimiento"]),
                                idPaisNacionalidad = Convert.ToInt32(dr["idPaisNacionalidad"]),
                                idPaisResidencia = Convert.ToInt32(dr["idPaisResidencia"]),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"].ToString()),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"].ToString())
                            };
                        }

                    }



                    return oUsuario;
                }
                catch (Exception ex)
                {
                    return oUsuario;
                }
            }
        }



        public static List<Usuario> Listar()
        {
            List<Usuario> oListaUsuario = new List<Usuario>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_listar", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new Usuario()
                            {
                                id = Convert.ToInt32(dr["idPersona"]),
                                primerNombre = dr["primerNombre"].ToString(),
                                segundoNombre = dr["segundoNombre"].ToString(),
                                tercerNombre = dr["tercerNombre"].ToString(),
                                primerApellido = dr["primerApellido"].ToString(),
                                segundoApellido = dr["segundoApellido"].ToString(),
                                apellidoCasada = dr["apellidoCasada"].ToString(),
                                fechaNac = Convert.ToDateTime(dr["fechaNac"].ToString()),
                                idGenero = Convert.ToInt32(dr["idGenero"]),
                                idOcupacion = Convert.ToInt32(dr["idOcupacion"]),
                                idPaisNacimiento = Convert.ToInt32(dr["idPaisNacimiento"]),
                                idPaisNacionalidad = Convert.ToInt32(dr["idPaisNacionalidad"]),
                                idPaisResidencia = Convert.ToInt32(dr["idPaisResidencia"]),
                                activo = dr["activo"].ToString(),
                                idUsuarioIng = Convert.ToInt32(dr["idUsuarioIng"]),
                                fechaIng = Convert.ToDateTime(dr["fechaIng"].ToString()),
                                idUsuarioAct = Convert.ToInt32(dr["idUsuarioAct"]),
                                fechaAct = Convert.ToDateTime(dr["fechaAct"].ToString())
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

        public static bool ModificarPer(Usuario oUsuario)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_modificarpersona", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idpersona", oUsuario.id);
                cmd.Parameters.AddWithValue("@primerNombre", oUsuario.primerNombre);
                cmd.Parameters.AddWithValue("@segundoNombre", oUsuario.segundoNombre);
                cmd.Parameters.AddWithValue("@tercerNombre", oUsuario.tercerNombre);
                cmd.Parameters.AddWithValue("@primerApellido", oUsuario.primerApellido);
                cmd.Parameters.AddWithValue("@segundoApellido", oUsuario.segundoApellido);
                cmd.Parameters.AddWithValue("@apellidoCasada", oUsuario.apellidoCasada);
                cmd.Parameters.AddWithValue("@fechaNac", oUsuario.fechaNac);
                cmd.Parameters.AddWithValue("@idGenero", oUsuario.idGenero);
                cmd.Parameters.AddWithValue("@idOcupacion", oUsuario.idOcupacion);
                cmd.Parameters.AddWithValue("@idPaisNacimiento", oUsuario.idPaisNacimiento);
                cmd.Parameters.AddWithValue("@idPaisNacionalidad", oUsuario.idPaisNacionalidad);
                cmd.Parameters.AddWithValue("@idPaisResidencia", oUsuario.idPaisResidencia);
                cmd.Parameters.AddWithValue("@activo", oUsuario.activo);
                cmd.Parameters.AddWithValue("@idUsuarioIng", oUsuario.idUsuarioIng);
                cmd.Parameters.AddWithValue("@fechaIng", oUsuario.fechaIng);
                cmd.Parameters.AddWithValue("@idUsuarioAct", oUsuario.idUsuarioAct);
                cmd.Parameters.AddWithValue("@fechaAct", oUsuario.fechaAct);

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
        public static bool Eliminar(int id)
        {
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("usp_eliminar", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@idusuario", id);

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
