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


    public class doctoIdentificacionController : ControllerBase
    {
        public bool Registrardoc([FromBody] doctoIdentificacion ndoc)
        {
            return doctoIdentificacionData.RegistrarDocto(ndoc);
        }
        public List<doctoIdentificacion> Listardocto()
        {
            return doctoIdentificacionData.Listartipodocto();
        }

        public doctoIdentificacion ObtenertipdocID(int id)
        {
            return doctoIdentificacionData.Obtenertipodocid(id);
        }
        public bool ModificartipoDoc([FromBody] doctoIdentificacion ntipdoc)
        {
            return doctoIdentificacionData.Modificartipodoc(ntipdoc);
        }
        public bool Eliminartipdoc(int id)
        {
            return doctoIdentificacionData.EliminarTipoDoc(id);
        }
    }
}
