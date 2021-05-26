using controlmigra.Data;
using controlmigra.Modelo;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace controlmigra.Controllers
{

    [ApiController]
    [Route("api/[action]/{id?}")]
    
    public class UsuarioController : ControllerBase
    {

        public bool RegistrarPersona([FromBody] Usuario oUsuario)
        {
            return UsuarioData.Registrar(oUsuario);
        }

      
        public Usuario ObtenerporID(int id)
        {
            return UsuarioData.Obtener(id);
        }

        public List<Usuario> ListarPersonas()
        {
            return UsuarioData.Listar();
        }

        public bool editarpersona([FromBody] Usuario oUsuario)
        {
            return UsuarioData.ModificarPer(oUsuario);
        }

        public bool EliminarPersona(int id)
        {
            return UsuarioData.Eliminar(id);
        }
    }
}
