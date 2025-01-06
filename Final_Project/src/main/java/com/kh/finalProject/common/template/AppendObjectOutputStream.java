package com.kh.finalProject.common.template;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;

public class AppendObjectOutputStream extends ObjectOutputStream {

	public AppendObjectOutputStream(OutputStream out) throws IOException {
		super(out);
	}
	
	@Override
    protected void writeStreamHeader() throws IOException {
        // 아무것도 하지 않음으로써 헤더를 생략
    }

}
