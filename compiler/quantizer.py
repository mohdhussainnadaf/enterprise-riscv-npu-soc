import json

def quantize_weights(float_matrix, scale=127.0):
    quantized = []
    for row in float_matrix:
        quant_row = [max(-128, min(127, int(val * scale))) for val in row]
        quantized.append(quant_row)
    return quantized

if __name__ == "__main__":
    sample_weights = [[0.25, -0.5], [0.8, 0.1]]
    q_matrix = quantize_weights(sample_weights)
    print(f"[COMPILER] Quantized INT8 Tensor Matrix: {q_matrix}")
