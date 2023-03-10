def main():
    DELIMITER: str = "// ***"

    PATH: str = "./practice-elte-course/01 week/02 exercise"

    INPUT_FILE: str = "week_01_exercise_02.icl"

    with open(
        f"{PATH}/{INPUT_FILE}", "r", encoding="utf-8"
    ) as input_file:
        contents: str = input_file.read()

        splitted_content: list[str] = contents.split(DELIMITER)

    for i, content in enumerate(splitted_content[1:], 1):
        module: str = f"ex_{i:02}"

        with open(
            f"{PATH}/{module}.icl",
            "w",
            encoding="utf-8",
        ) as output_file:
            output_file.write(
                f"module {module}\nimport StdEnv\n\n{content.strip()}"
            )


if __name__ == "__main__":
    main()
