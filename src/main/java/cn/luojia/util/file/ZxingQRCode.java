package cn.luojia.util.file;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Hashtable;

import javax.imageio.ImageIO;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.DecodeHintType;
import com.google.zxing.EncodeHintType;
import com.google.zxing.LuminanceSource;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.Result;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * 
 * @author luojiaBusiness
 * @CreateDate 2020年2月21日
 * @Description 二维码实现
 */
public class ZxingQRCode {
	
	/**
	 * 生成二维码
	 * @param contents 二维码内容
	 * @param width 宽度
	 * @param height 高度
	 * @param imgPath 路径
	 * @param path 系统当前路径
	 */
	public void encode(String contents, int width, int height, String imgPath, String path) {
		
		Hashtable<EncodeHintType, Object> hints = new Hashtable();
		// 设置纠错等级
		hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.M);
		// 设置编码格式
		hints.put(EncodeHintType.CHARACTER_SET, "utf-8");
		// 设置白边,其实没有去除的效果
		hints.put(EncodeHintType.MARGIN, 0);
		// 设置二维码颜色
		// MatrixToImageConfig config = new MatrixToImageConfig(0xFF00CCCC, 0xFFFFFFFF);
		try {
			BitMatrix bitMatrix = new MultiFormatWriter().encode(contents, BarcodeFormat.QR_CODE, width, height,
					hints);
			// 删除白边
			BufferedImage image = deleteWhite(bitMatrix, path);
			// bitMatrix = deleteWhite(bitMatrix);
			ImageIO.write(image, "png", new FileOutputStream(imgPath));
			// MatrixToImageWriter.writeToStream(bitMatrix, "png", new FileOutputStream(imgPath), config);
			System.out.println("QR Code encode sucsess! the img's path is " + imgPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 删除二维码白边
	public BufferedImage deleteWhite(BitMatrix matrix, String path) throws Exception {
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
		// 二维码图片logo
		image = createPhotoAtCenter(image, path + "make/xlsprint/logo.jpg");
		return image;
	}

	private BufferedImage createPhotoAtCenter(BufferedImage bufImg,String imgFile) throws Exception {
		Image im = ImageIO.read(new File(imgFile));
		Graphics2D g = bufImg.createGraphics();
		//获取bufImg的中间位置
		int centerX = bufImg.getMinX() + bufImg.getWidth()/2 - 80/2;
		int centerY = bufImg.getMinY() + bufImg.getHeight()/2 - 80/2;
		g.drawImage(im,centerX,centerY,80,80,null);
		g.dispose();
		bufImg.flush();
		return bufImg;
	}
	
	/**
	 * 解析二维码
	 * @param imgPath 图片路径
	 * @return 
	 */
	public String decode(String imgPath) {
		BufferedImage image = null;
        Result result = null;
        try {
        	image = ImageIO.read(new File(imgPath));
        	if (image == null) {
                System.out.println("the decode image may be not exit.");
            }
        	LuminanceSource source = new BufferedImageLuminanceSource(image);
            BinaryBitmap bitmap = new BinaryBitmap(new HybridBinarizer(source));

            Hashtable<DecodeHintType, Object> hints = new Hashtable();
            //设置显示格式为GBK
            hints.put(DecodeHintType.CHARACTER_SET, "utf-8");
            //进行解码
            result = new MultiFormatReader().decode(bitmap, hints);
            return result.getText();//返回结果信息
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return null;
	}
}
