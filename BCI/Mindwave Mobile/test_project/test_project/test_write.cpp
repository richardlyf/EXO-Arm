//// basic file operations
//#include <iostream>
//#include <fstream>
//
//
//int main() {
//	std::ofstream myfile("mindWaveData.txt");
//	//std::ofstream myfile;
//	//myfile.open("mindWaveData.txt");
//	//myfile << data << "\n";hehe nope
//	myfile << "Write to my file, data. \n";
//	myfile.close();
//	return 0;
//}


#include <stdio.h>
FILE * stream;

int main()
{
	errno_t err;
	err = fopen_s(&stream, "testfile.txt", "w+");

	if (err == 0)
	{
		printf("The file 'data2' was opened\n");
	}
	else
	{
		printf("The file 'data2' was not opened\n");
	}

	if (stream != NULL)
	{
		fputs("file is created and written in", stream);
		fclose(stream);
	}

	return 0;
}