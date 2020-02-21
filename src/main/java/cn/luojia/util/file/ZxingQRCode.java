package cn.luojia.util.file;

import java.awt.Color;
import java.awt.image.BufferedImage;
import java.io.FileOutputStream;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月21日
 * @Description 二维码实现
 */
public class ZxingQRCode {
	
	/**
	 * 
	 * @param contents 二维码内容
	 * @param width 宽度
	 * @param height 高度
	 * @param imgPath 路径
	 */
	public void encode(String contents, int width, int height, String imgPath) {
		Hashtable<EncodeHintType, Object> hints = new Hashtable();
		// 设置纠错等级
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
		// 设置编码格式
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		// 设置白边,其实没有完全去除的效果
		hints.put(EncodeHintType.MARGIN, 0);
		// 设置二维码颜色
		// MatrixToImageConfig config = new MatrixToImageConfig(0xFF00CCCC, 0xFFFFFFFF);
		try {
			BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height,
					hints);
			// 删除白边
			BufferedImage image = deleteWhite(bitMatrix);
			// bitMatrix = deleteWhite(bitMatrix);
			ImageIO.write(image, "png", new FileOutputStream(imgPath));
			// MatrixToImageWriter.writeToStream(bitMatrix, "png", new FileOutputStream(imgPath), config);
			System.out.println("QR Code encode sucsess! the img's path is " + imgPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除二维码白边
	public BufferedImage deleteWhite(BitMatrix matrix) {
		int[] rec = matrix.getEnclosingRectangle();
		int resWidth = rec[2] + 1;
		int resHeight = rec[3] + 1;

		BitMatrix resMatrix = new BitMatrix(resWidth, resHeight);
		resMatrix.clear();
		for (int i = 0; i < resWidth; i++) {
			for (int j = 0; j < resHeight; j++) {
				 if (matrix.get(i + rec[0], j + rec[1]))
                        resMatrix.set(i, j);
			}
		}

		int width = resMatrix.getWidth();
		int height = resMatrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		for (int x = 0; x < width; x++) {
			for (int y = 0; y < height; y++) {
				image.setRGB(x, y, resMatrix.get(x, y) ?  Color.BLACK.getRGB():Color.WHITE.getRGB());
			}
		}

		return image;
	}
}
