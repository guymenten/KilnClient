package kiln.tools;

import haxe.macro.Expr.Var;

/**
 * ...
 * @author GM
 */
class PIDController
{
    /// <summary>
    /// A (P)roportional, (I)ntegral, (D)erivative Controller
    /// </summary>
    /// <remarks>
    /// The controller should be able to control any process with a
    /// measureable value, a known ideal value and an input to the
    /// process that will affect the measured value.
    /// </remarks>
    /// <see cref="https://en.wikipedia.org/wiki/PID_controller"/>

	var processVariable	:Float;

	public function new(GainProportional:Float, GainIntegral:Float, GainDerivative:Float, OutputMax:Float, OutputMin:Float)
	{
		this.GainDerivative 	= GainDerivative;
		this.GainIntegral 		= GainIntegral;
		this.GainProportional 	= GainProportional;
		this.OutputMax 			= OutputMax;
		this.OutputMin 			= OutputMin;
	}

	/// <summary>
	/// The controller output
	/// </summary>
	@:isVar public var ControlVariable(get, set):Float;
	public function set_ControlVariable(value:Float):Float { ControlVariable = value; return value; }
 
	public function get_ControlVariable():Float
	{
		var error:Float = SetPoint - ProcessVariable;
		IntegralTerm += (GainIntegral * error);
		if (IntegralTerm > OutputMax) IntegralTerm = OutputMax;
		if (IntegralTerm < OutputMin) IntegralTerm = OutputMin;
		var dInput:Float = processVariable - ProcessVariableLast;

		var output:Float = GainProportional * error + IntegralTerm - GainDerivative * dInput;

		if (output > OutputMax) output = OutputMax;
		if (output < OutputMin) output = OutputMin;

		return output;
	}

	/// <summary>
	/// The derivative term is proportional to the rate of
	/// change of the error
	/// </summary>

	public var GainDerivative:Float;

	/// <summary>
	/// The integral term is proportional to both the magnitude
	/// of the error and the duration of the error
	/// </summary>
	public var GainIntegral:Float;

	/// <summary>
	/// The proportional term produces an output value that
	/// is proportional to the current error value
	/// </summary>
	/// <remarks>
	/// Tuning theory and industrial practice indicate that the
	/// proportional term should contribute the bulk of the output change.
	/// </remarks>
	public var GainProportional:Float;

	/// <summary>
	/// The max output value the control device can accept.
	/// </summary>
	public var OutputMax:Float;

	/// <summary>
	/// The minimum ouput value the control device can accept.
	/// </summary>
	public var OutputMin:Float;

	/// <summary>
	/// Adjustment made by considering the accumulated error over time
	/// </summary>
	/// <remarks>
	/// An alternative formulation of the integral action, is the
	/// proportional-summation-difference used in discrete-time systems
	/// </remarks>
	public var IntegralTerm:Float;

	/// <summary>
	/// The current value
	/// </summary>
	public var ProcessVariable:Float;
	
	public function ProcessVariable_get()
	{
		return processVariable;
	
	}
	public function ProcessVariable_set(value:Float)
	{
			ProcessVariableLast = processVariable;
			processVariable = value;
	}

	/// <summary>
	/// The last reported value (used to calculate the rate of change)
	/// </summary>
	public var ProcessVariableLast:Float;

	/// <summary>
	/// The desired value
	/// </summary>
	public var SetPoint:Float;
	
}