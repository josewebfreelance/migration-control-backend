using controlmigra.Modelo;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Data
{
    public class prechequeoData
    {

        public static List<prechequeo> Listprechequeo()
        {
            List<prechequeo> oListaUsuario = new List<prechequeo>();
            using (SqlConnection oConexion = new SqlConnection(Conexion.rutaConexion))
            {
                SqlCommand cmd = new SqlCommand("sp_lisPrechequeo", oConexion);
                cmd.CommandType = CommandType.StoredProcedure;

                try
                {
                    oConexion.Open();
                    cmd.ExecuteNonQuery();

                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {

                        while (dr.Read())
                        {
                            oListaUsuario.Add(new prechequeo()
                            {
                                idPrechequeo = Convert.ToInt32(dr["idPrechequeo"]),
                                idDoctoPersona = Convert.ToInt32 (dr["idDoctoPersona"]),
                                codigo = dr["codigo"].ToString(),
                                fecha = Convert.ToDateTime(dr["fecha"]),
                                idDelegacion = Convert.ToInt32(dr["idDelegacion"]),
                                idTipoMovimiento = Convert.ToInt32(dr["idTipoMovimiento"]),
                                fechaLlegada = Convert.ToDateTime(dr["fechaLlegada"]),
                                fechaSalida = Convert.ToDateTime(dr["fechaSalida"]),
                                idTipoViaje = Convert.ToInt32(dr["idTipoViaje"]),
                                idRuta = Convert.ToInt32(dr["idRuta"]),
                                idPaisOrigen = Convert.ToInt32(dr["idPaisOrigen"]),
                                idPaisDestino = Convert.ToInt32(dr["idPaisDestino"]),
                                placaVehiculo = dr["placaVehiculo"].ToString(),
                                dineroMayorLimite = dr["dineroMayorLimite"].ToString(),
                                autorizaCompartir = dr["autorizaCompartir"].ToString(),
                                aurtorizaVerificar = dr["aurtorizaVerificar"].ToString(),
                                idLimiteDinero = Convert.ToInt32(dr["idLimiteDinero"]),
                                llaveCifrada = dr["llaveCifrada"].ToString(),
                                qr = dr["qr"].ToString(),
                                ip = dr["ip"].ToString(),
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
    }
}
