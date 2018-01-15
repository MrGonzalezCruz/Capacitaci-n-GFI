package com.sigecu.service.implemt;

import org.apache.commons.logging.LogFactory;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.logging.Log;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.sigecu.converter.EvaluacionAlumnoConverter;
import com.sigecu.converter.EvaluacionConverter;
import com.sigecu.converter.PreguntasConverter;
import com.sigecu.converter.RespuestasConverter;
import com.sigecu.entity.Cursos;
import com.sigecu.entity.Evaluaciones;
import com.sigecu.entity.Eventos;
import com.sigecu.entity.Preguntas;
import com.sigecu.entity.Respuestas;
import com.sigecu.model.CursoModel;
import com.sigecu.model.EvaluacionesModel;
import com.sigecu.model.PreguntasModel;
import com.sigecu.model.RespuestasModel;
import com.sigecu.repository.CursosRepository;
import com.sigecu.repository.EvaluacionAlumnoRepository;
import com.sigecu.repository.EvaluacionRepository;
import com.sigecu.repository.EventosRepository;
import com.sigecu.repository.PreguntasRepository;
import com.sigecu.repository.QueryEvaluacion;
import com.sigecu.repository.RespuestasRepository;
import com.sigecu.service.EvaluacionAlumnoService;

@Service("EvaluacionAlumnoImpl")

public class EvaluacionAlumnoImpl  implements EvaluacionAlumnoService{
	
	private static final Log LOG = LogFactory.getLog(EvaluacionAlumnoImpl.class);
	
		

	@Autowired
	@Qualifier("evaluacionesRepository")
	private EvaluacionRepository evaluacionesRepository;
	
	@Autowired
	@Qualifier("evalaucionesConverter")
	private EvaluacionConverter evaluacionConverter;
	
	@Autowired
	@Qualifier("cursoRepository")
	private CursosRepository cursoRepository;
	
	@Autowired
	@Qualifier("preguntasConverter")
	private PreguntasConverter preguntasConverter;
	
	@Autowired
	@Qualifier("preguntasRepository")
	private PreguntasRepository preguntasRepository;

	@Autowired
	@Qualifier("queryEvaluacion")
	private QueryEvaluacion queryEvaluacion;
	
	@Autowired
	@Qualifier("respuestasRepository")
	private RespuestasRepository respuestasRepository;

	@Autowired
	@Qualifier("respuestasConverter")
	private RespuestasConverter respuestasConverter;
	
	@Autowired
	@Qualifier("evalaucionesConverter")
	private EvaluacionConverter evalaucionesConverter;
	
	@Autowired
	@Qualifier("eventosRepository")
	private EventosRepository eventoRepository;
	
	
	
	@Override
	public List<PreguntasModel> listarPreguntasByEvaluacionAlumno(int idExam){
		List<Preguntas> listPreguntas = queryEvaluacion.findAllPreguntasById(idExam);
		List<PreguntasModel> preguntasModel = new ArrayList<PreguntasModel>();
		
		for(Preguntas preg : listPreguntas) {
			preguntasModel.add(preguntasConverter.converterPreguntasToPreguntasModel(preg));
		}
		return preguntasModel;
	}

	
	@Override
	public List<RespuestasModel> listarRespuestas() {
		List<Respuestas> respuestas = respuestasRepository.findAll();
		List<RespuestasModel> respModel = new ArrayList<RespuestasModel>();
		for (Respuestas resp : respuestas) {
			respModel.add(respuestasConverter.converterRespuestasToRespuestasModel(resp));
		}
		return respModel;
	}


	@Override
	public List<EvaluacionesModel> listAllEvaluaciones(int idCurso) {
		return null;
	}


	@Override
	public List<RespuestasModel> listarRespuestas(int idExamen) {
		// TODO Auto-generated method stub
		return null;
	}


	
	
	@Override
	public String tiempoExamen(int idEvaluacion) {
		Evaluaciones eval= evaluacionesRepository.findByIdEvaluacion(idEvaluacion);
	    EvaluacionesModel evaluacionmodel = evaluacionConverter.convertEvaluacion2EvaluacionModel(eval);
		return evaluacionmodel.geteTiempo();
	}
	
	public String calificacion(int idEvaluacion) {
		Evaluaciones eval= evaluacionesRepository.findByIdEvaluacion(idEvaluacion);
	    EvaluacionesModel evaluacionmodel = evaluacionConverter.convertEvaluacion2EvaluacionModel(eval);
		return evaluacionmodel.getePorcentaje();
	}


//	@Override
//	public List<EvaluacionesModel> EvaluacionPorEvento(int idEvento) {
//		List<Evaluaciones> 
//		
//		return null;
//	}
	
	
}
