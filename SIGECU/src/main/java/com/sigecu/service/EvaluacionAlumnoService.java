package com.sigecu.service;

import java.util.List;

import com.sigecu.model.PreguntasModel;

public interface EvaluacionAlumnoService {
	
	public abstract List<PreguntasModel> listarPreguntasByEvaluacion(int idEvaluacion, int idAsignaExamen);
	
	public abstract void guardarRespuestas (int idRespuesta, int idAsignaExamen);
	
	public abstract void marcarExamenRealizado(int idAsignaExamen);

	public abstract String tiempoExamen(int idEvaluacion);
	
	public abstract String calificacion(int idEvaluacion);
}
